main(List<String> args) {
  // 构造函数重定向
  var p = Person("sunchegnxiu");
  print(p);

  // 常量构造函数
  const p1 = Person1("sun");
  const p2 = Person1("sun");
  // 如下会报错,常量构造函数必须用常量修饰
  // var p1 = Person1("sun");
  // var p2 = Person1("sun");
  print(identical(p1, p2));

  // 工厂构造函数,需要自己手动返回一个对象
  final s = Student._withName("sunchengxiu");
  final s1 = Student._withName("sunchengxiu");
  print(identical(s1, s));

  // set get 方法
  final p3 = Person("sunchengixu");
  p3.setName = "sunbaofu";
  print(p3.getName);

  // 抽象类,见下

  // 隐式接口，见下
  // 默认情况下，所有类都是隐式接口

  // 混入,定义混入不能用class，mixin 关键字定义，with 实现
  final mm = mman();
  mm.running();
  mm.eatting();

}

class Person {
  String name;
  int age;
  // 构造函数重定向
  Person(String name, [int i]) : this._init(name, i ??= 100);

  Person._init(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return "name is $name,age is $age";
  }
  // set 方法
  // set setName(String name){
  //   this.name = name;
  // }
  set setName(String name) => this.name = name;

  // String get getName{
  //   return this.name;
  // }

  String get getName => name;
}

// 常量构造函数
class Person1 {
  final String name;

  const Person1(this.name);
}

// 传入 name 相同，返回相同的对象
class Student {
  String name;

  // cache
  static final Map<String, Student> _nameCache = {};
  // 工厂构造函数，可以手动返回一个对象
  factory Student._withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final s = Student(name);
      _nameCache[name] = s;
      return s;
    }
  }

  Student(this.name);
}

class Teacher {
  String name;
  Teacher(this.name);
}

class Stu extends Teacher {
  int age;
  // 需要调用一下父类
  Stu(String name,this.age): super(name);
}

// 抽象类，方法可以没有实现，普通的类，方法需要有实现
// 抽象类不能实例化
// 可以通过工厂实例化
abstract class AbsClass {
  void run();
  

} 

// 继承自抽象类之后，必须实现抽象类的抽象方法
class SubAbs extends AbsClass {
  @override
  void run() {
    print("im run");
  }
  
}


// 接口
class run {
  void running(){

  }
}

class fly {
  void flying() {

  }
}
// 必须实现接口所有的方法
class man implements run,fly{
  @override
  void running() {
    // TODO: implement running
  }

  @override
  void flying() {
    // TODO: implement flying{

    }
  
}

mixin Runner {
  void running(){
    print("runner runnint");
  }
}

mixin Eatter {
  void eatting(){
    print("eatter eating");
  }
}

class mman with Runner,Eatter {
 
  // void eatting() {
  //   print("mman eeatting");
  // }

  void eatting() {
    // TODO: implement eatting
    print("mman eeatting");
    // super.eatting();
  }
  
}