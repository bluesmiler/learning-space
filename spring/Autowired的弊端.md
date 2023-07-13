# 使用@Autowired注解，不建议基于字段的依赖注入

使用@Autowired注解基于字段的[依赖注入](https://so.csdn.net/so/search?q=依赖注入&spm=1001.2101.3001.7020)时，IDEA会出现弱警告，如下：

![image-20221203170522303](C:\Users\29793\AppData\Roaming\Typora\typora-user-images\image-20221203170522303.png)

思考：为什么不推荐使用，这种方式是不是有更好的替代方案。

### 依赖注入方式

依赖注入有三种方式：

- 基于字段注入
- 基于构造器注入
- 基于set方法注入

## 1、基于字段注入



### 优点：

1. 注入方式简单：字段上附上注解@AutoWired即可。
2. 可观性强：整体代码简洁明了。

### 缺点：

##### 		1.无法用于final修饰的变量

​		final类型的变量在调用class的构造函数的这个过程当中就得初始化完成，这个是基于字段的依赖注入做不到的地方，只能使用基于构造函数的依赖注入的方式.

##### 		2.掩饰单一职责的设计思想

​		如果采用的是基于构造函数的依赖注入来使用Spring的IOC，当你注入的太多的时候，这个构造方法的参数就会很庞大，类似于下面。当你看到这个类的构造方法那么多参数的时候，你自然而然的会想一下:这个类是不是违反了单一职责思想?
但是使用基于字段的依赖注入不会让你察觉，你会很沉浸在@Autowire当中。

```java
public class VerifyServiceImpl implents VerifyService{
    
  private AccountService accountService;
  private UserService userService;
  private IDService idService;
  private RoleService roleService;
  private PermissionService permissionService;
  private EnterpriseService enterpriseService;
  private EmployeeService employService;
  private TaskService taskService;
  private RedisService redisService;
  private MQService mqService;
 
  public SystemLogDto(AccountService accountService, 
                      UserService userService, 
                      IDService idService, 
                      RoleService roleService, 
                      PermissionService permissionService, 
                      EnterpriseService enterpriseService, 
                      EmployeeService employService, 
                      TaskService taskService, 
                      RedisService redisService, 
                      MQService mqService) {
      this.accountService = accountService;
      this.userService = userService;
      this.idService = idService;
      this.roleService = roleService;
      this.permissionService = permissionService;
      this.enterpriseService = enterpriseService;
      this.employService = employService;
      this.taskService = taskService;
      this.redisService = redisService;
      this.mqService = mqService;
  }
}
```



##### 		3.与Spring的IOC机制紧密耦合

​		使用基于字段的依赖注入方式的时候，把控制权全给Spring的IOC了，别的类想重新设置下你的某个注入属性，没法处理(当然反射可以做到)。本身Spring的目的就是解藕和依赖反转，结果通过再次与类注入器（在本例中为Spring）耦合，失去了通过自动装配类字段而实现的对类的解耦，从而使类在Spring容器之外无效.。即对于IOC容器以外的环境，除了使用反射来提供它需要的依赖之外，无法复用该实现类。

##### 		4.隐藏依赖性

​		当使用Spring的IOC的时，被注入的类应当使用public类型的方法(构造方法，setter类型方法)来向外界表达：我需要什么依赖。但是基于字段的依赖注入的方式，基本都是private形式的，private把属性都给封印到class当中了。

##### 		5.无法对注入的属性进行安全检查

​		在程序启动的时候无法拿到这个类，只有在真正的业务使用的时候才会拿到，若注入的是null，因为不调用将一直无法发现NullPointException的存在。或者想在属性注入的时候，增加验证措施，也无法办到。

## 2、构造器注入

```java
@Controller
@RequestMapping("employee")
public class EmployeeController {
    
    private final EmployeeMapper employeeMapper;
    
    @Autowired
    public EmployeeController(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }
}
```



### 优点：

1. 保证依赖不可变（final关键字）。
2. 保证依赖不为空（省去了我们对其检查）。
3. 保证返回客户端（调用）的代码的时候是完全初始化的状态。
4. 避免了循环依赖。
5. 提升了代码的可复用性。
6. 可以明确成员变量的注入顺序。

### 缺点：

​	当注入参数较多时，代码臃肿。

## 3、set方法注入

```java
@Controller
@RequestMapping("employee")
public class EmployeeController {
    
    private EmployeeMapper employeeMapper;
    
    @Autowired
    public void setEmployeeMapper(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }
}
```



### 优点：

1. 相比构造器注入，set注入类似于选择性注入。
2. 允许在类构造完成后重新注入。

### 缺点：

​	暂无

## 总结

1. 通过上面，我们可以看到，**基于字段的依赖注入**方式有很多缺点，我们应当**避免使用基于字段的依赖注入**。
2. 对于**必需**的依赖项，建议使用**基于构造函数的注入**，以使它们成为不可变的，并防止它们为null。
3. 对于**可选**的依赖项，建议使用**基于Setter的注入。**

