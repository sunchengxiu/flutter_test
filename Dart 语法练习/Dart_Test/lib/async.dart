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
