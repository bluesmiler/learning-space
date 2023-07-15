# Result类杂谈

## 在JAVA中返回类型使用泛型T和Object有什么区别？

单从上文2个方法声明来说-没有区别。无论是t 还是 obj，你都只能调用Object类型的参数和返回值。

但是基于上面2个方法，如果你有一个使用了泛型的类：

```java
MyClass<Foo> my = new MyClass<Foo>();
Foo foo = new Foo();
```

就可以这么写：

```java
Foo newFoo = my.doSomething(foo);
```

但是如果是使用object的话，就得这么写

```java
Foo newFoo = (Foo) my.doSomething(foo);
```

由此可见，使用泛型，有2个好处：

1.不需要做强制类型转换

2.编译时更安全。如果使用Object类的话，你没法保证返回的类型一定是Foo，也许是其它类型。这时你就会在运行时得到一个类型转换异常（ClassCastException）

## 泛型标记符

- E Element 集合元素
- T Type Java类
- K Key 键
- V Value 值
- N Number 数值类型
- ？ 表示不确定的Java类型

这些标记并不是**限定只有对应的类型才能使用**，即使你统一使用A-Z英文字母的其中一个，编译器也不会报错。之所以又不同的标记符，这是一种**约定。**在开发中很多规则都是一种约定，它能提高我们代码的可读性，方便团队见的合作开发