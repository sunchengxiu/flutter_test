main(List<String> args) {
  // 明确类型

  String name = "sunchengxiu";

  // 声明常量,final,const, const 必须赋值，final 不需要，可以通过函数或者计算获得。
  final age = 26;
  // 不可以
  // age = 30;
  const tall = 183;
  // 不可以
  // tall=190;

  // 变量
  var weight = 150;
  weight = 160;

  // 拼接字符串
  var res =
      "my name is ${name},age is ${age},tall is ${tall},weight is ${weight}";
  var res1 = "result is $res,type is ${res.runtimeType}";
  print(res1);

  // 判断是否相等
  final p1 = Person("sunchengxiu");
  final p2 = Person("sunchengxiu");
  print(identical(p1, p2));

  // 列表
  var list = ["sun", "cheng", "xiu"];

  // 集合
  var set = {"beijing", "shanghai", "guangzhou"};

  // map
  var map = {"name": "sunchengxiu", "age": 26, "tall": 183};

  // 位置可选参数测试
  // test("sun");
  // test("sunchengxiu",26,183);

  // 命名可选参数
  test1("sunchengxiu", tall: 183);
  test1("sunchengxiu", age: 260);

  // 函数作为另一个函数的参数
  test2(test22);

  // 匿名函数
  test2(() {
    print("匿名函数被打印");
    // 匿名函数可以有返回值,另一个地方接受就行
    return 100;
  });

  // 箭头函数：函数体只有一行代码
  test2(() => print("箭头函数被调用了"));

  // 带参数的函数
  // test3((a, b) => sum(a, b));
  // test3((a, b) {
  //   return a - b;
  // });
  // test3((a, b) =>  a - b);
  test3((a, b) => sum(a, b));

  // ??= 符号
  // ?? 前面有值，就用？？前面的值，如果没有，就用后面的值。
  var a = "sunchengxiu";
  name ??= "sunbaofu";
  var b = null;
  b ??= 26;
  print("name is $a,age is $b");

  // 级联运算符
  var p4 = Person("sunchengxiu")
    ..name = "sunbaofu"
    ..eat()
    ..run();

  // 命名构造函数测试
  var p5 = Person.withNameAndAgeAndHeight("sunchengxiu", 26, 183);
  var p6 = Person.fromMap({"name": "sunchengxiu", "age": 26, "height": 183});
  print(p6);

  //  可选参数构造函数测试
  var pp1 = Person1("sunchengxiu",age:20);
  print(pp1);
}

// 位置可选参数,只有可选参数才有默认值
void test(String name, [int age = 2, int tall]) {
  var message = "my name is $name, age is $age , tall is $tall";
  print(message);
}

// 命名可选参数
void test1(String name, {int age = 2, int tall = 190}) {
  var message = "my name is $name, age is $age , tall is $tall";
  print(message);
}

// 函数可以作为另一个函数的参数

void test2(Function other) {
  other();
}

void test22() {
  print("im test 22");
}

typedef SUM = int Function(int a, int b);

void test3(SUM sum) {
  int res = sum(10, 20);
  print("sum is $res");
}

int sum(int a, int b) {
  print("进到 sum 函数了");
  return a - b;
}

class Person {
  String name;
  int age;
  int height;

  Person(String name) {
    this.name = name;
  }
  // 命名构造函数
  Person.withNameAndAgeAndHeight(this.name, this.age, this.height);
  // dynamic 任意类型
  Person.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }
  void run() {
    print("im run");
  }

  void eat() {
    print("im eat");
  }

  @override
  String toString() {
    // TODO: implement toString
    return "name is $name,age is $age,height is $height";
  }
}

class Person1 {
  final String name;
  final int age;
  
  // 初始化列表，可选参数，如果没有给age就给默认值10，如果给定，就用给定的值。
  Person1(this.name,{int age}):this.age = age ?? 10{

  }
  @override
  String toString() {
    // TODO: implement toString
    return "person1 name is $name,age is $age";
  }
}
