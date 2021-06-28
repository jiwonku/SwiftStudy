import UIKit

var str = "Hello, playground"


/*
 Protocol :
 특정 기능 수행에 필수적인 요소를 정의한 청사진입니다.
 프로토콜을 만족시키는 타입을 포로토콜을 따른다 혹은 준수한다(confirm)고 말합니다.
 타입에서 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 청사진의 기능을 모두 구현해야 합니다.
 즉, 프로토콜은 기능을 정의하고 제시할 뿐이지 스스로 기능을 구현하지는 않습니다.
 프로토콜에 필수 구현을 추가하거나 추가적인 기능을 더하기 위해 프로토콜을 확장(extend)하는 것이 가능합니다.
 */

/*
 다음과 같은 형식으로 프로토콜을 따르는 타입을 정의할 수 있다.
 
 protocol SomeProtocol : superClass , FirstProtocol , AnotherProtocol {
 
 }
 타입 이름 뒤에 콜론을 붙이고 따를 프로토콜을 이름을 적는다. 만약 프로토콜이 여러개라면 콤마(,)로 구분해 준다
 서브 클래싱인 경우 수퍼 클래스를 포로토콜 앞에 적어준다
 
 */



/*
 프로토콜 요구사항
 프로토콜은 타입이 특정 기능을 수행하기 위해 필요한 기능을 요구한다.
 프로토콜이 자신을 채택한 타입에 요구하는 사항은 프로퍼티나 메소드와 같은 기능들이다.
 프로토콜은 프로퍼티, 메소드, 서브스크립트, 이니셜라이져 등의 기능을 요구할 수 있다.
 */

//protocol의 요구사항은 항상 var 키워드를 사용한 변수 프로퍼티에 정의된다.
//읽기와 쓰기가 모두 가능한 프로퍼티는 정의 뒤에 {get set} 이라고 명시하며, 읽기전용 프로퍼티는 프로퍼티의 정의 뒤에 {get} 이라고 명시해준다.

protocol someProtocol {
    var settableProperty : String {get set}
    var notNeedToBeSettableProperty : String {get}
}

protocol anotherProtocol {
    static var someTypeProperty : Int {get set}
    static var anotherTypeProperty : Int {get}
}

/*
 타입 프로퍼티르 ㄹ요구하려면 static 키워드를 사용한다.
 클래스의 타입 프로퍼티에는 상속 가능한 타입 프로퍼티인 class 타입 프로퍼티와 상속 불가능한 static 타입 프로퍼티가 있지만,
 프로토콜에서는 따로 구분하지 않고 모두 static 키워드를 사용하여 타입 프로퍼티를 요구하면 된다.
 */
 

//ex:
protocol Talkable {
    var topic : String {get set}
}

struct Person : Talkable {
    var topic: String
}



protocol FullyNamed {
    var fullName : String {get}
}

struct OtherPerson : FullyNamed {
    var fullName: String
}

var john = OtherPerson(fullName: "Christoper")
john.fullName = "tom"
print(john.fullName)






/*
 프로토콜은 특정 인스턴스 메소드나 타입 메소드를 요구할 수 있음.
 프로토콜이 요구할 메소드는 프로토콜 정의에서 작성한다. 메소드의 실제 구현부인 {} 는 생략하고 메소드의 이름, 매개변수, 리턴 타입 등만 작성한다.
 프로토콜의 메소드 요구에서는 매개변수 기본값을 지정할 수 없다. 
 */

protocol Talkable2 {
    var topic : String {get set}
    func talk(to : Person2)
}

struct Person2 : Talkable2 {
    var topic: String
    var name : String
    
    func talk(to: Person2) {
        print("\(topic)에 대해 \(to.name)에게 이야기 합니다.")
    }
}


var aa = Person2.init(topic: "money", name: "jason")
aa.talk(to: aa)








/*
 프로토콜은 프로퍼티, 메소드 등과 마찬가지로 특정한 이니셜라이저를 요구할 수 있음.
 프로토콜에서 이니셜라이저를 요구하려면 메소드 요구와 마찬가지로 이니셜라이저를 정의하지만 구현은 하지 않습니다.
 즉, 이니셜 라이저의 매개변수를 지정하기만 할 뿐, 중괄호를 포함한 이니셜라이저 구현은 하지 않습니다.
 */


protocol Talkable3 {
    var topic : String {get set}
    func talk(to : Person3)
    init(name : String, topic : String)
}

struct Person3 : Talkable3 {
    var topic: String
    var name : String
    func talk(to: Person3) {
        print("\(topic)에 대해 \(to.name)에게 이야기 합니다.")
    }
    
    init(name: String, topic: String) {
        self.name = name
        self.topic = topic
    }
}

let tom : Person3 = Person3(name: "Tom", topic: "math")
let steve : Person3 = Person3(name: "steve", topic: "english")

tom.talk(to: steve)
steve.talk(to: tom)







/*
 프로토콜 상속
 프로토콜은 하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많은 요구사항을 추가할 수 있음.
 프로토콜 상속 문법은 클래스의 상속 문법과 유사하다.
 */


protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable : Readable {
    func speak()
}

protocol readWriteSpeakble : Readable , Writeable {
    func speak()
}

// SomeClass는 readWriteSpeakble을 채택하였는데, readWriteSpeakble은 Readable , Writeable을 상속받았기 때문에 read() , write() , speak()메소드를 모두 구현해야 한다.
class SomeClass : readWriteSpeakble {
    func read() {
        print("read")
    }

    func write() {
        print("write")
    }

    func speak() {
        print("speak")
    }
}






/*
 익스텐션
 extension은 스위프트의 강력한 기능 중 하나.
 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능.
 
 기능을 추가하려는 타입의 구현된 소스코드를 알지 못하거나 볼 수 없다 해도, 타입만 알고 있다면 그 타입의 기능을 확장할 수 있음.
 
 - 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
 - 타입 메소드 / 인스턴스 메소드
 - 이니셜 라이저
 - 서브스크립트
 - 중첩 타입
 - 특정 프로토콜을 준수할 수 있도록 기능 추가
 
 익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존의 기능을 재정의 할 수는 없음.
 클래스의 상속은 클래스 타입에서만 가능하지만 익스텐션은 구조체, 클래스, 프로토콜 등에 적용이 가능함.
 클래스의 상속은 특정 타입을 물려받아 하나의 새로운 타입을 정의하고 추가 기능을 구현하는 수직 홪장이지만, 익스텐션은 기존의 타입에 기능을 추가하는 수평 확장.
 
                상속                  익스텐션
 확장           수직확장                수평확장
 사용         클래스 타입만        클래스, 구조체, 프로토콜, 제네릭 등 모든 타입
 재정의           가능                   불가
 
 */





/*
 원래 타입을 정의한 소스에 기능을 추가하는 방법도 있겠지만, 외부 라이브러리나 프레임워크를 가져다 썼다면 원본 소스를 수정하지 못함.
 이처럼 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할 때 익스텐션을 사용한다.
 따로 상속을 받지 않아도 되며, 구조체와 열거형에도 기능을 추가할 수 있으므로 익스텐션은 매우 편리한 기능이다.
 
 익스텐션은 클래스, 구조체, 프로토콜, 제네릭 등 모든 타입에 적용할 수 있음.
 즉, 익스텐션을 통해 모든 타입에 연산 프로퍼티, 메소드, 이니셜라이저, 서브 스크립트, 중첩 데이터 타입등을 추가할 수 있음.
 */




extension Int {
    var isEven : Bool {
        return self % 2 == 0
    }
    
    var isOdd : Bool {
        return self % 2 == 1
    }
    
    func multiply(by n : Int) -> Int {
        return self * n
    }
}

print(1.isEven)
print(1.isOdd)
print(2.isEven)
print(2.isOdd)


var number : Int = 3

print(number.isEven)
print(number.isOdd)


number = 2

print(number.isEven)
print(number.isOdd)


print(3.multiply(by: 2))
print(4.multiply(by: 5))

number = 3

print(number.multiply(by: 2))
print(number.multiply(by: 3))

/*
 위 코드의 익스텐션은 Int 타입에 두 개의 연산 프로토콜을 추가한 것.
 int 타입의 인스턴스가 홀수인지 짝수인지 판별하여 bool 타입으로 알려주는 연산 프로퍼티.
 익스텐션으로 Int 타입에 추가해준 연산 프로퍼티는 Int타입의 어떤 인스턴스에도 사용이 가능하다.
 위의 코드처럼 인스턴스 연산 프로퍼티를 추가할 수도 있으며, static키워드를 사용하여 타입 연산 프로퍼티도 추가할 수 있다.
 
 익스텐션을 통해 타입에 메소드를 추가할 수 있음.
 Int 타입에 인스턴스 메소드인 multiply(by:) 를 추가했음.
 */








