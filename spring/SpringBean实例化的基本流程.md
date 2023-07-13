## IoC、DI和AOP思想的提出

- IoC思想

Inversion of Control，控制反转，强调的是原来在程序中创建Bean的权利反转给第三方

- DI思想

Dependence Injection，依赖注入，强调的Bean之间的关系，这种关系第三方负责去设置

- AOP思想

Aspect Oriented Programming，面向切面编程，功能的横向抽取，主要的实现方式就是Proxy



## 基于xml的Spring应用

### Bean的实例化基本流程

- 加载xml配置文件，解析获取配置中的每一个<bean>的信息，封装成一个个的BeanDefinition对象
- 将BeanDefinition储存在一个名为beanDefinitionMap<String, BeanDefinition>中
- ApplicationContext底层遍历beanDefinitionMap，创建Bean实例对象
- 创建好的Bean实例对象，被储存在一个名为singletonObjects的Map<String, Object>中
- 当执行applicationContext.getBean(beanName)时，从singletionObjects去匹配Bean实例返回

![image-20230226201419018](C:\Users\29793\AppData\Roaming\Typora\typora-user-images\image-20230226201419018.png)

