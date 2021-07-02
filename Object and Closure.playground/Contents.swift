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
