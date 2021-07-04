import UIKit

var str = "Hello, playground"


/*
 일급 객체
 1. 객체가 런타임에도 생성이 가능해야 한다.
 2. 인자값으로 객체를 전달할 수 있어야 한다.
 3. 반환값으로 객체를 사용할 수 있어야 한다.
 4. 변수나 데이터 구조 안에 저장할 수 있어야 한다.
 5. 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다.
 */

// 함수가 이런 조건을 만족하면 이를 일급 함수라고 하고 그 언어를 함수형 언어로 분류한다.
// 즉, 함수형 언어에서는 함수가 일급 객체로 대우받는 뜻.



/*
 변수나 상수에 함수를 대입할 수 있음.
 => 말 그대로험슈 저채룰 뵨슈애 집어 넣는다는 뜻.
 => 함수가 대입된 변수나 상수는 함수처럼 실행할 수도 있고, 인자값을 입력받을 수도 있다.
 => 또한 반환값도 가질 수 있다.
 => 함수를 대입한 변수가 함수처럼 실행된다는 것은 함수 호출 형식이 확장됨을 의미한다.
 */


func foo(base:Int) -> String {
    return "result is \(base + 1)"
}

let fn1 = foo(base: 5)
print(fn1) // "result is 6"


let fn2 = foo

print(fn2(5)) // "result is 6"

// fn2는 foo와 이름만 다를 뿐 인자값, 같은 기능, 같은 반환값을 가지는 함수가 된다.



func foo2(base:Int)->String {
    print("func foo is run")
    return "result is \(base + 1)"
}

let fn3 = foo2(base: 4) // func foo is run , "result is 5"

let fn4 = foo2

fn4(8) // func foo is run , "result is 9"





/*
 함수 타입 : 변수에 함수를 대입하면 그 변수는 일반적인 문자열, 정수, 배열 또는 딕셔너리와는 전혀 다른 타입이 되는데 이를 함수타입 이라고 한다.
 간단히 말해서 정수를 대입하면 int 타입, 스트링을 대입하면 string 타입, 함수를 대입하면 함수타입.
 */



func boo(age:Int) -> String {
    return "\(age)"
}

//위 boo 함수를 함수 타입형태로 표한하면
//(Int) -> String

let s: (Int) -> String = boo


func boo2(age:Int, name:String) -> String {
    return "\(name)'s age is \(age)"
}

//(Int, String) -> String

let s2 : (Int, String) -> String = boo2

let s3 : (Int, String) -> String = boo2(age:name:)

// boo2는 정확한 함수 실별자가 아니다. 정확한 식별자는 boo2(age:name:) 이다.

// boo2는 함수의 이름, boo2(age:name:)는 함수의 식별자.







func boo3(age:Int) -> String {
    return "\(age)"
}

func boo3(age:Int , name:String) -> String {
    return "\(name)'s age is \(age)"
}

//let t = boo3  , 어느 함수를 가리키는 것인지 정확하게 판단할 수 없으므로 오류가 발생한다.

let t1:(Int,String) -> String = boo3
let t2 = boo3(age:name:)

let t3:(Int) -> String = boo3(age:)
let t4 = boo3(age:)

t1(5, "jason") // "jason's age is 5"
t4(4) // "4"

/*
 t3과 t4는 같은 이름(boo3)의 함수를 할당받지만, 타입 어노테이션 차이로 인해 각각 다른 함수가 대입된다.
 */



/*
 함수 타입을 표시할 때 반환값이 없는 경우에는 빈 괄호 대신 Void를사용하여 명시적으로 '값이 없음'을 표시하기도 한다.
 Void는 빈 튜플을 나타내는 값으로, 타입 알리어스로 정의된 단어이다.
 Void 키워드의 첫 글자는 대문자이다.
 Void는 반환타입으로만 사용될 수 있다 , 인자타입으로는 사용될 수 없다.
 */









/*
 함수의 반환 타입으로 함수를 사용할 수 있다.
 
 */


func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String { // func pass() -> Void -> String
    return desc
}

let p = pass()
p() // "this is desc()"


// desc 함수는 인자 값 없이 문자열만 반환하고 있기 때문에 이를 함수 타입으로 표현하면 () -> String 형식이 된다.

/*
 상수 p는 pass 함수의 싱핼 결과값을 할당받고 있다.
 만약 pass 함수 자체를 할당 받았다면 상수 p에 할당된 것은 pass함수였겠지만, pass 함수의 실행 결과는 desc함수이므로 상수 p에는 desc함수가 할당된다.
 즉, 상수 p 는 desc 함수나 마찬가지이다.
 */



/*
 func pass() -> Void -> String
 
 제일 왼쪽 화살표를 찾아서 기준으로 삼으면 된다.
 외쪽 화살표의 왼쪽은 인자타입, 오른쪽은 반환타입이다.
 
 반환타입을 살펴보니 함수타입으로 작성되어 있다. 즉, 함수를 반환한다.
 여기서 다시 해당 함수를 구분할 수 있다.
 
 Void -> String
 
 Void가 인자타입, String이 반환타입니다.
 
 */


func plus(a :Int , b: Int) -> Int {
    return a + b
}

func minus(a :Int , b: Int) -> Int {
    return a - b
}

func times(a :Int , b: Int) -> Int {
    return a * b
}

func devide(a :Int , b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    
    return a / b
}

func calc(_ operand : String) -> (Int, Int) -> Int {
    switch operand {
    case "+":
        return plus
    case "-":
        return minus(a:b:)
    case "*":
        return times
    case "/":
        return devide(a:b:)
    default:
        return plus
    }
}

let c = calc("*")
c(4,5)// 20

/*
 함수 타입 표현식은 (Int, Int) -> Int 이다.
 외부 매개변수를 언더바로 처리하여 함수 호출 시 인자 레이블을 생략할 수 있도록 하였다.
 함수의 실행 결과로 다른 함수를 반환할 수 있다.
 */






/*
 함수의 인자값으로 함수를 사용할 수 있다.
 함수를 인자로 전달할 때 그 함수는 하나의 타입이 된다.
 */


func incr(param:Int) -> Int {
    return param + 1
}

func broker(base:Int , function : (Int) -> Int) -> Int {
    return incr(param: base)
}

broker(base: 3, function: incr) // 4

broker(base: 3, function: incr(param:)) // 4


/*
 broker(base:function:)은 두 번째 매개변수에 대한 인자값에 어떤 함수가 들어오는지 상관하지 않는다.
 단지 정수를 입력받고 정수를 반환하는 타입의 함수이기만 하면 된다.
 그러니 borker(base:function:) 함수의 정의 구문만으로는 어떤 연산이 실행될지 짐작하지 어렵고 실질적인 연산은 인자값으로 받는 함수에 달려 있다.
 보통 이런 식으로 중개 역할을 하는 함수를 브로커(Broker)라고 한다.
 */










/*
 콜백 함수
 */

func successThrough() {
    print("cal is success")
}

func failThrough() {
    print("cal is fail")
}

func divide(base:Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    guard base != 0 else {
        fCallBack() // 실패 함수 , fCallBack은 함수처럼 보이지만, 실제로는 매개변수이다. 여기에 함수가 대입되었을 뿐이다.
                    // 외부에서 전달된 실패 처리 함수를 fCallBack 매개변수를 통하여 실행한 다음 0을 반환하면서 함수를 종료한다.
                    // 그렇기에 함수가 실행되기 전에는 실패 처리 내용을 알 수 없다.
        return 0
    }
    
    defer {  // defer 구문
        sCallBack() // 성공 함수
    }
    
    return 100 / base
}

divide(base: 4, success: successThrough, fail: failThrough) // 25 , cal is success
divide(base: 0, success: successThrough, fail: failThrough) // 0 , cal is fail

/*
 함수 인자를 사용하여 콜백을 처리하고 있다.
 두 번째 인자는 내부 연산과정이 성공적으로 완료 되었을 때 실행할 함수
 세 번째 인자는 내부 연산과정이 실패했을 때 실행할 함수
 
 함수를 인자로 넘기는 가장 큰 목적은 함수 내부의 코드를 건드리지 않고도 외부에서 실행 흐름을 추가하기 위함.
 함수 외부에서 함수 내부에 실행 구문을 추가할 수 있다는 것은, 함수를 그만큼 재활용 할 수 있다는 장점이 된다.
 */

/*
  defer  구문
 작성된 위치와 순서에 상관없이 함수가 종료되기 직전에 실행된다.
 defer 블록을 읽기 전에 함수의 실행이 종료될 경우 defer 블록은 실행되지 않는다.
 하나의 함수나 메소드 내에서 defer 블록을 여러번 사용할 수 잇다. 이때에는 가장 마지막에 작성된 defer 블록부터 역순으로 실행된다.
 defer 블록을 중첩해서 사용할 수 있다. 이때는 바깥쪽 defer 블록부터 실행되며 가장 안쪽에 있는 defer 블록은 가장 마지막에 실행된다.
 
 함수를 종료하기 전에 처리해야 하는 변수나 상수들 중에서 처리 시점이 모두 달라서 적절한 처리 시점을 잡기 어려울 때 defer 구문을 통해 처리하면 된다.
 */


/*
 익명 함수 : 클로저
 일회용 함수
 함수의 형태를 가지지만 이름이 부여되지 않으며, 일회용이기 때문에 여러가지 간편한 작성 형식을 따른다.
 위의 예제에서 재사용하지 않는 코드는 굳이 함수로 작성한다면 비능률적이되기에 이와 같은 익명 함수를 사용한다.
 */

divide(base:30 , success : {
    () -> Void in
    print("cal is success")
} , fail: {
    () -> Void in
    print("there is a error")
}
)


