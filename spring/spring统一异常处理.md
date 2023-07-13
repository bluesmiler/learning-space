# 统一异常处理

在 Spring 项目中，我们可以通过如下三种常见方案来实现全局统一异常处理。

- 基于 SpringBoot 的全局统一异常处理，需要实现 ErrorController 接口。
- 基于 Spring AOP 实现全局统一异常处理。
- 基于 @ControllerAdvice 注解实现 Controller 层全局统一异常处理。

使用统一异常处理的优点:

- 标准统一的返回结果，系统交互更加友好
- 有效防止业务异常没有被捕获的情况
- 代码更加干净简洁，不需要开发者自己定义维护异常
    

## 基于SpringBoot的统一异常处理

通过实现 ErrorController 接口，来实现自定义错误异常返回。支持返回 JSON 字符串、自定义错误页面，可以做到根据不同 status 跳转不同的页面，代码示例：

```java
@Slf4j
@RestController
@EnableConfigurationProperties({ServerProperties.class})
public class ExceptionController implements ErrorController {
    private static final String ERROR_PATH = "/error";
    private ErrorAttributes errorAttributes;
    @Autowired
    private ServerProperties serverProperties;
    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
    @Autowired
    public ExceptionController(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }
    /**
     * web页面错误处理
     */
    @RequestMapping(value = ERROR_PATH, produces = "text/html")
    @ResponseBody
    public ModelAndView errorHtml404(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = null;
        ServletWebRequest requestAttributes = new ServletWebRequest(request);
        Map<String, Object> model = getErrorAttributes(requestAttributes, isIncludeStackTrace(request, MediaType.ALL));
        model.put("queryString", request.getQueryString());
        // 根据不同状态码返回不同页面，这里以404/500为例
        HttpStatus status = getStatus(request);
        if (status.value() == HttpStatus.INTERNAL_SERVER_ERROR.value()) { // 500
            modelAndView = new ModelAndView("500", model);
        } else if (status.value() == HttpStatus.NOT_FOUND.value()) { // 404
            modelAndView = new ModelAndView("404", model);
        } else {
            modelAndView = new ModelAndView("error", model);
        }
        return modelAndView;
    }
    /**
     * 除web页面外的错误处理，比如json/xml等
     */
    @RequestMapping(value = ERROR_PATH)
    @ResponseBody
    public R errorApiHander(HttpServletRequest request) {
        ServletWebRequest requestAttributes = new ServletWebRequest(request);
        Map<String, Object> attr = getErrorAttributes(requestAttributes, isIncludeStackTrace(request, MediaType.ALL));
        HttpStatus status = getStatus(request);
        return R.error(status.value(), attr.get("message").toString());
    }
    /**
     * 确定是否应该包含 StackTrace 属性
     */
    protected boolean isIncludeStackTrace(HttpServletRequest request, MediaType produces) {
        ErrorProperties.IncludeStacktrace include = this.serverProperties.getError().getIncludeStacktrace();
        if (include == ErrorProperties.IncludeStacktrace.ALWAYS) {
            return true;
        }
        return include == ErrorProperties.IncludeStacktrace.ON_TRACE_PARAM && getTraceParameter(request);
    }
    /**
     * 获取错误的信息
     */
    private Map<String, Object> getErrorAttributes(WebRequest webRequest, boolean includeStackTrace) {
        return this.errorAttributes.getErrorAttributes(webRequest, includeStackTrace);
    }
    /**
     * 是否包含 trace
     */
    private boolean getTraceParameter(HttpServletRequest request) {
        String parameter = request.getParameter("trace");
        return parameter != null && !"false".equalsIgnoreCase(parameter);
    }
    /**
     * 获取错误编码
     */
    private HttpStatus getStatus(HttpServletRequest request) {
        Integer statusCode = (Integer) request
                .getAttribute("javax.servlet.error.status_code");
        if (statusCode == null) {
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
        try {
            return HttpStatus.valueOf(statusCode);
        } catch (Exception ex) {
            log.error("获取当前 HttpStatus 发生异常", ex);
            return HttpStatus.INTERNAL_SERVER_ERROR;
        }
    }
}

```

我们可以根据不同异常状态码跳转不同页面，比如：400、403、404、500等异常，并且对于非 web 端请求可以返回 JSON 数据。但是它无法获取到异常的具体错误码，同时也无法根据异常类型进行不同的响应。

## 基于Spring AOP实现统一异常处理

首先使用 @Aspect 来声明一个切面，使用 @Pointcut 来定义切入点位置，然后使用 @Around 环绕通知来处理方法请求，当请求方法抛出异常后，使用 catch 捕获异常并通过 handlerException 方法处理异常信息。

通过上面的操作我们就可以实现异常的统一管理以及通过切面获取接口信息等。

```java
@Slf4j
@Component
@Aspect
public class AspectException {
    @Pointcut("execution(* com.xwj.exception.solution_2.demo.controller.*.*(..))") // 切入点
    public void pointCut(){}
    @Around("pointCut()")
    public R handleControllerMethod(ProceedingJoinPoint pjp) {
        Stopwatch stopwatch = Stopwatch.createStarted();
        R r;
        try {
            log.info("执行Controller开始: " + pjp.getSignature() + " 参数：" + Lists.newArrayList(pjp.getArgs()).toString());
            r = (R) pjp.proceed(pjp.getArgs());
            log.info("执行Controller结束: " + pjp.getSignature() + "， 返回值：" + r.toString());
            log.info("耗时：" + stopwatch.stop().elapsed(TimeUnit.MILLISECONDS) + "(毫秒).");
        } catch (Throwable throwable) {
            r = handlerException(pjp, throwable);
        }
        return r;
    }
    /**
     * 处理异常信息
     */
    private R handlerException(ProceedingJoinPoint pjp, Throwable e) {
        R r = null;
        if (e instanceof BusinessException) {
            BusinessException businessException = (BusinessException) e;
            log.error("BusinessException{方法：" + pjp.getSignature() + "， 参数：" + pjp.getArgs() + ",异常：" + businessException.getMessage() + "}", e);
            r = R.error(businessException.getCode(), businessException.getMessage());
        } else if (e instanceof RuntimeException) {
            log.error("RuntimeException{方法：" + pjp.getSignature() + "， 参数：" + pjp.getArgs() + ",异常：" + e.getMessage() + "}", e);
            r = R.error(400, "未知异常");
        } else {
            log.error("异常{方法：" + pjp.getSignature() + "， 参数：" + pjp.getArgs() + ",异常：" + e.getMessage() + "}", e);
            r = R.error(500, "系统异常");
        }
        return r;
    }
}

```

基于AOP原理实现的异常捕获，可以有效的捕获 controller、service 中出现的异常，而且还可以统一打印接口请求入参和返回结果日志，打印接口访问性能日志等，但是无法处理进入 controller 前出现的异常以及参数校验异常等情况。

## @ControllerAdvice 统一异常处理

基于 @ControllerAdvice 注解实现的 Controller 层全局统一异常处理，同时还需要配合 @ExceptionHandler 注解一起使用。

**@ControllerAdvice**

作用于类上，使用该注解可以实现三个方面的功能：1. 全局异常处理；2. 全局数据绑定；3. 全局数据预处理。在项目中使用这个注解可以帮我们简化很多工作，它是 SpringMVC 提供的功能，并且在 SpringBoot 中也可以直接使用。

在进行全局异常处理时，需要配合 @ExceptionHandler 注解使用。

**@RestControllerAdvice**

同样也是作用于类上，它是 @ControllerAdvice 和 @ResponesBody 的合体，可以支持返回 JSON 格式的数据。在后面的代码示例中就会使用这个注解。

**@ExceptionHandler**

作用于方法上，顾明思议，它就是一个异常处理器，作用是统一处理某一类异常，可以很大程度的减少代码重复率和复杂度。该注解的 value 属性可以用于指定具体的拦截异常类型。

如果有多个 @ExceptionHandler 存在，则需要指定不同的 value 类型，由于异常类拥有继承关系，所以 @ExceptionHandler 会首先执行在继承树中靠前的异常类型。基于这个特性，我们可以使用 @ExceptionHandler 来处理程序中各种具体异常了，比如处理：

- ServletException，即进入 Controller 前的异常，如：
    NoHandlerFoundException、HttpRequestMethodNotSupportedException、HttpMediaTypeNotSupportedException等
- 基于特定业务的自定义业务异常，如：BusinessException、BaseException
- 参数校验异常，如：BindException、
    MethodArgumentNotValidException、ConstraintViolationException
- 未知异常，当上面的异常处理无法捕获某个异常时，统一使用 Throwable 来捕获，并响应为未知异常

**统一异常处理类**

```java
@Slf4j
@RestControllerAdvice
public class UnifiedExceptionHandler {
    /**
     * 未知异常
     */
    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable t) {
        log.error("未知异常，{}，异常类型：{}", t.getMessage(), t.getClass());
        return R.error();
    }
    /**
     * 业务异常
     */
    @ExceptionHandler(value = BusinessException.class)
    public R handleBusinessException(BusinessException e) {
        log.error("业务处理异常，{}", e.getMessage(), e);
        return R.error(e.getCode(), e.getMessage());
    }
    /**
     * 进入 Controller 前的相关异常
     */
    @ExceptionHandler({
            NoHandlerFoundException.class,
            HttpRequestMethodNotSupportedException.class,
            HttpMediaTypeNotSupportedException.class,
            HttpMediaTypeNotAcceptableException.class,
            MissingPathVariableException.class,
            MissingServletRequestParameterException.class,
            TypeMismatchException.class,
            HttpMessageNotReadableException.class,
            HttpMessageNotWritableException.class,
            ServletRequestBindingException.class,
            ConversionNotSupportedException.class,
            MissingServletRequestPartException.class,
            AsyncRequestTimeoutException.class
    })
    @ResponseBody
    public R handleServletException(Exception e) {
        log.error("网络请求异常，{}", e.getMessage(), e);
        return R.error(CommonResponseEnum.SERVLET_ERROR);
    }
    /**
     * 参数校验(Valid)异常
     */
    @ExceptionHandler(value = {MethodArgumentNotValidException.class})
    public R handleValidException(MethodArgumentNotValidException e) {
        log.error("数据校验异常，{}，异常类型：{}", e.getMessage(), e.getClass());
        BindingResult bindingResult = e.getBindingResult();
        Map<String, String> errorMap = getErrorMap(bindingResult);
        return R.error(CommonResponseEnum.PARAM_ERROR).put("data", errorMap);
    }
    /**
     * 参数绑定异常
     */
    @ExceptionHandler(value = {BindException.class})
    public R handleValidException(BindException e) {
        log.error("数据校验异常，{}，异常类型：{}", e.getMessage(), e.getClass());
        BindingResult bindingResult = e.getBindingResult();
        Map<String, String> errorMap = getErrorMap(bindingResult);
        return R.error(CommonResponseEnum.PARAM_ERROR).put("data", errorMap);
    }
    /**
     * 约束校验异常
     */
    @ExceptionHandler(value = {ConstraintViolationException.class})
    public R handleValidException(ConstraintViolationException e) {
        log.error("数据校验异常，{}，异常类型：{}", e.getMessage(), e.getClass());
        List<String> violations = e.getConstraintViolations().stream()
                .map(ConstraintViolation::getMessage).collect(Collectors.toList());
        String error = violations.get(0);
        return R.error(CommonResponseEnum.PARAM_ERROR).put("data", error);
    }
    /**
     * 获取校验失败的结果
     */
    private Map<String, String> getErrorMap(BindingResult result) {
        return result.getFieldErrors().stream().collect(
                Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage, (k1, k2) -> k1)
        );
    }
    /**
     * DataBinder 数据绑定访问器，集合参数校验时需要这个数据绑定
     */
    @InitBinder
    private void activateDirectFieldAccess(DataBinder dataBinder) {
        dataBinder.initDirectFieldAccess();
    }
}

```

从上面的代码中可以看出，在不同异常情况下会响应不同的异常错误码，根据异常错误码我们可以快速定位系统问题。当然也可以根据异常类型响应HTTP状态码

**无法捕获404异常**
完成上面的工作后，在默认配置情况下，我发现404异常 （NoHandlerFoundException ），不会被统一异常处理器处理，经过翻阅相关资料发现，需要在项目配置文件中增加如下配置：

```yaml
spring:
  mvc:
    throw-exception-if-no-handler-found: true # 表示当没有对应处理器时，允许抛出异常
  resources:
    add-mappings: false # 表示是否为静态资源添加对应的处理器

```

添加上述配置后就可以让404异常在统一异常处理器中生效了，详细的原因分析，在这里就不进行描述了，感兴趣的小伙伴找度娘。另外需要注意的是，如果你的项目中使用到了静态资源，那么请忽略上面的配置，否则会导致无法处理静态资源。

## 总结

- ErrorController 接口实现类 虽然可以对全局错误进行处理，但是它无法获取到异常的具体错误码，同时也无法根据异常类型进行不同的响应。

- 使用 AOP 方案不仅可以做全局统一异常处理，还可以统一打印接口请求入参和返回结果日志，打印接口访问性能日志等。但是无法处理进入 controller 前出现的异常以及参数校验异常。

- @ControllerAdvice 配合 @ExceptionHandler 一起使用可以捕获全部异常情况，包括ServletException、参数校验异常、自定义业务异常、其他未知异常等，但是在默认情况下无法捕获 404 异常，需要在项目配置中进行额外处理。
    