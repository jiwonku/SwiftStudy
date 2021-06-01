import UIKit


/*
 함수 : 의존성 없이 독립적으로 실행 가능한 코드를 모듈 단위로 분리해 놓은 것.
 */

/*
 함수의 장점
 1. 동일한 코드가 여러곳에서 사용될 때 이를 함수화 하면 재 작성할 필요 없이 함수 호출만으로 처리할 수 있음.
 2. 전체 프로세스를 하나의 소스로 연속적으로 처리하는 것보다 기능 단위로 함수화하면 가독성이 좋아지고, 코드와 로직을 이해하기 쉬움.
 3. 비드니스 로직을 변경해야 할 때 함수 내부만 수정하면 되므로 유지보수가 용이해짐.
 */





/*
 1. 함수는 func 키워드로 시작한다.
 2. () 안에는 함수에 전달할 매개변수(파라미터)를 정의한다.
 3. 매개변수가 필요없으면 빈 괄호로 둔다.(괄호 생략 불가)
 4. 반환타입을 표시할 때는 -> 기호로 표시한다.
 5. 반환값은 return 키워드를 사용한다.
 */

func testPrint(){
    print("hello world")
}

func sayHello() -> String {
    let returnValue = "hello"
    return returnValue
}

func printHelloWithName(name:String){
    print("Hello \(name) ~")
}

func sayHelloWithName(name:String) ->String{
    let returnValue = "Hello \(name) ~"
    return returnValue // 반환 타입으로 정의된 string 이어야 함.
}

testPrint() // testPrint가 함수 이름이고 ()가 함수 호출 연산자

print(sayHello())

printHelloWithName(name: "Jason") // 함수를 정의할 때 매개변수를 string 타입으로 정의했을므로 함수 호출 시 매개변수는 string이어야 함.

let myName = "Jason"
printHelloWithName(name: myName)

/*
 함수를 호출할 때는 name: 와 같이 인자 레이블을 붙여주어야 함.
 인자 레이블을 붙이지 않고 바로 파라미터만 넣으면 에러 발생.
 그리고 일반적으로 인자레이블은 매개변수 이름과 동일함.
 */


print(sayHelloWithName(name: "Tom"))









