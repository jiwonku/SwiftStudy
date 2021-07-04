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

print(sayHello()) // sayHello()에서 string이 리턴되고 해당 string을 print 하는 구문

printHelloWithName(name: "Jason") // 함수를 정의할 때 매개변수를 string 타입으로 정의했으므로 함수 호출 시 매개변수는 string이어야 함.

let myName = "Jason"
printHelloWithName(name: myName)

/*
 함수를 호출할 때는 name: 와 같이 인자 레이블을 붙여주어야 함.
 인자 레이블을 붙이지 않고 바로 파라미터만 넣으면 에러 발생.
 그리고 일반적으로 인자레이블은 매개변수 이름과 동일함.
 */


print(sayHelloWithName(name: "Tom"))




/*
 함수 - 튜플
 */

func getUserInfo() -> (Int, Character, String) {
    
    let gender:Character = "M"
    let height = 180
    let name = "Jason"
    
    return (height, gender, name) // 반환값으로 선언한 순서대로 int, character, string 순서대로 반환해야 한다.
}

var uinfo = getUserInfo()

uinfo.0 // height
uinfo.1 // gender
uinfo.2 // name


var(a,b,c) = getUserInfo()
a
b
c


/*
 위에서는 튜플 반환값을 정의 할 때 타입만 있었는데, 하기와 같이 변수를 할당할 수도 있음.
 이렇게 하면 함수의 결과값을 받은 변수에도 이들이 자동으로 바인딩 됨.
 */

func getUserInfo2() -> (h:Int, g:Character, n:String){
    let gender:Character = "M"
    let height = 180
    let name = "jason"
    
    return (height, gender, name)
}

var result = getUserInfo2()

result.h
result.g
result.n



/*
 타입 알리어스 :
 이름이 길거나 사용하기 복잡한 타입 표현을 새로운 타입명으로 정의해줌
 특정 튜플 타입이 여러 곳에서 사용될 경우에 리턴하는 축약형 타입을 정의
 */


typealias infoResult = (Int, Character, String)

func getUserInfo3() -> infoResult {
    let gender : Character = "M"
    let height = 180
    let name = "jason"
    
    return (height, gender, name)
}

var info = getUserInfo3()

info.0
info.1
info.2








/*
 매개변수
 
 내부 매개변수 : 함수가 내부적으로 인자값을 참조하기 위해 사용하는 변수
 외부 매개변수 : 함수 외부에서 함수나 인자값을 구분하기 위해 사용하는 변수
 
 외부 매개변수를 사용하지 않을 때는 일반 매개변수가 인자 레이블 역할을 하지만, 외부 매개변수를 명시적으로 정의하면 외부 매개변수가 인자 레이블이 된다.
 
 외부 매개변수는 매개변수명이 내부와 외부에서 바라보는 의미가 달라 외부와 내부로 구분하여 사용할 필요가 있을 때,
 혹은 내부 매개변수 명을 외부로 공개하기를 원치 않을 때 사용함.
 하지만 가장큰 목적은 objevtive-c 와의 호환성 때문.
 
 */


func printHello(name: String, msg: String){
    print("\(name), \(msg)")
}

printHello(name: "jason", msg: "hello")
//함수명이 printHello(name:msg:)


func printHello2(to name: String, welcomeMessage msg: String){
    print("\(name), \(msg)")
}


printHello2(to: "jason", welcomeMessage: "hello2")
//함수명이 printHello(to:welcomeMessage:)


//매개변수를 사용하지 않고 싶다면 _를 입력하면 매개변수 생략 가능.

func printHello3(_ name:String, _ msg:String){
    print("\(name), \(msg)")
}

printHello3("jason", "hello3")





/*
 가변인자
 함수는 보통 미리 정의된 형식과 개수에 맞는 인자값만 처리하지만, 때에 따라서는 가변적인 개수의 인자값을 입력받아야 할 때도 있음.
 이를 위해서 매개변수명 다음에 ... 연산자를 추가.
 이렇게 정의된 매개변수는 가변인자로 인식되어 개수를 제한하지 않고 인자값을 입력 받으며, 입력된 인자값을 배열로 나타냅니다.
 */

func avg(score:Int...) -> Double{
    var total = 0
    for r in score {
        total += r
    }
    
    return (Double(total)) / Double(score.count)
}

print(avg(score: 1,2,3,4,5))



/*
 기본값을 갖는 매개변수
 매개변수에 기본값을 지정할 수 있음.
 */

func echo(message:String, newline:Bool = true){
    if newline == true{
        print(message, true)
    } else{
        print(message, false)
    }
}

echo(message: "hello") // newLine이 true로 기본 세팅 되었으므로 생략 가능
echo(message: "hello",newline: true)
echo(message: "hello",newline: false)




/*
 매개변수는 정확히는 변수가 아니라 상수
 함수 내부에서 매개변수를 수정하려고 하면 에러 발생.
 
 함수를 호출할 때 변수를 대입해 준 경우에도 실제로는 값의 복사를 통해 상수가 새로 정의된 다음 전달 됨.
 
 */

func incrementBy(base:Int) -> Int{
    var a = base
    a += 1
    
    return a
}






/*
 inOut 매개변수
 
 보통 함수 내부에서 진행되는 동작은 함수 외부에 영향을 끼치지 않음.
 그런데 inout 키워드를 통한다면 함수 내부에서 수정된 인자값이 외부까지 영향을 끼침.
 */

var cnt = 30

print(incrementBy(base: cnt)) // 31
print(cnt) //30



func foo(paramCount: inout Int) -> Int{
    paramCount += 1
    return paramCount
}

// 인자값이 전달 될때 새로운 매개상수를 만들어서 복사하는 대신 인자값 자체를 함수 내부로 전달.
// 조금 더 정확히는 값 자체를 전달하는 것이 아니라 값이 저장된 메모리 주소를 전달하는 것.
// c언어의 포인터와 유사함
// 함수를 호출할 때는 & 연산자를 사용하는데, & 연산자는 변수나 상수 앞에 붙어서 값이 저장된 메모리 주소를 읽어오는 역할을 함.

print(foo(paramCount: &cnt)) //31  // 정확히는 cnt변수의 주소값이 함수의 매개변수로 전달됨 & 함수에서는 inout 키워드로 해당 주소의 변수를 전달 받음.
print(cnt) //31

/*
 주소를 전달하는 것을 프로그래밍 용어로 '참조(reference)에 의한 전달' 이라고 함.
 기존처럼 값을 복사하여 전달하는 것을 '값에 의한 전달' 이라고 함.
 */





/*
 변수의 생존 범위와 생존 주기
 */

do {
    var ccnt = 0 // 1
    do {
        ccnt = 3 // 2
        print(ccnt)
    }
    
    ccnt += 1
    print(ccnt)
}

/*
 변수가 생성된 블럭이 아닌 다른 블럭에서 사용되려면 반드시 초기화가 되어 있어야 함.
 하나의 코드내에서 변수를 사용하는 것이 아니라 하나의 블럭에서 다른 블럭으로 참조에 의한 전달 과정이 일어나는 것.
 이를 위해서 변수의 주소값이 필요.
 만약 변수가 초기화 되지 않았다면 메모리를 할당받지 못한 상태이므로 주소값도 존재하지 않음.
 따라서 오류가 발생.
 
 */


//전역 변수 : 최상위 블럭에서 선언된 변수이므로 그보다 하위 블럭인 함수 내부에서 얼마든지 접근할 수 있음.

var count = 30

func foo() -> Int {
    count += 1
    return count
}

foo()


func isMinor(age : Int) -> Bool {
    
    if age > 19{
        return true
    }
        
    else {
        return false
    }
}


isMinor(age: 20)
