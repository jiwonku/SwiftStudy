import UIKit

var str = "Hello, playground"


/*
 
 */


class Date {
    var BC = false
    var year = 0
    var month = 0
    var day = 0
    var name : String {
        return (self.BC ? "BC" : "AC") + " \(self.year)-\(self.month)-\(self.day)"
    }
    
    init() { }
    
    init(y: Int, m: Int, d: Int, isBC: Bool = false) {
        self.BC = isBC
        self.year = y
        self.month = m
        self.day = d
    }
    
    func print() {
        Swift.print(self.name)
    }
}


/*

구조체와 마찬가지로 프로퍼티, 메소드, 생성자 등으로 구성되어 있다.

*/

var date = Date()
date.name // "AC 0-0-0"

var someDate = Date(y: 2020, m: 1, d: 21, isBC: false)
someDate.name // "AC 2020-1-21"
someDate.year = 2021
someDate.name   // "AC 2021-1-21"

someDate.print()   // AC 2021-1-21




/*

상속 : 객체지향 프로그래밍에서 클래스의 특징은 상속에 있다. 부모 클래스의 내용을 이어받는 자식 클래스는 부모 클래스의 기능과 속성을 이어 받으면서 자신(자식클래스)만을 위해 특정 기능을 추가하는 것이 가능하다.
일반적인 코드 디자인 관점에서 부모 클래스는 공통된 부분을 구현하고 자식 클래스는 자식 클래스들 만의 고유한 기능을 추가로 구현한다.

클래스와 구조체의 가장 큰 차이는 이 상속에 있다. 상속은 클래스에서만 가능한 개념이다.

*/





// parent class
class BaseDate {
    var year = 0
    var month = 0
    var day = 0
    var name : String {
        return "\(self.year)-\(self.month)-\(self.day)"
    }
    
    init() { }
    
    init(y: Int, m: Int, d: Int) {
        self.year = y
        self.month = m
        self.day = d
    }
    
    func print() {
        Swift.print(self.name)
    }
}


var baseDateInstance = BaseDate(y: 2002, m: 5, d: 8)
baseDateInstance.name // "2002-5-8"
baseDateInstance.print() // 2002-5-8



class myDate : BaseDate {  // baseDate를 상속 하겠다는 의미
    var BC = false    // BC는 자식 클래스만의 프로퍼티이다.
    override var name : String {     // override는 부모의 기능을 자식이 그대로 이어받는게 아니라 자식만의 기능을 덧붙여서 이어받는다는 의미.
        return (self.BC ? "BC" : "AC") + " " + super.name     // 부모의 name(super.name)을 호출하고 거기에 자식의 기능을 덧붙인다. / super는 부모를 의미한다.
    }
    
    init(y: Int, m: Int, d: Int, isBC : Bool = false) {   // myDate만의 생성자(init)
        super.init(y: y, m: m, d: d)
        self.BC = isBC        // self는 자기 자신을 의미한다.
    }
}

var someDate2 = myDate(y: 2002, m: 4, d: 14, isBC: false)
someDate2.print() // AC 2002-4-14
someDate2.name  // "AC 2002-4-14"
someDate2.year  // 2002
someDate2.year = 2014
someDate2.BC = true
someDate2.print()  // BC 2014-4-14




/*
생성자인 init의 경우 super.init()을 호출하는 부분이 있다.
super라는 부모클래스 인스턴스를 의미하므로 부모의 생성자(init)를 호출한다는 의미다. 따라서 .year, .month, .day 프로퍼티도 부모 덕분에 자동으로 초기화된다.
*/


/*
.name 프로퍼티는 override 라는 지시어로 부모의 .name을 이어받긴 했지만 getter를 변경하여 자신만의 추가기능을 가지도록 구현되었다.
그래서 부모는 가지고 있지 않던 .BC라는 프로퍼티를 이용해 문자열을 더 추가하는 기능을 가지고 있다.
super.name을 사용한 이유도 부모의 .name getter를 그대로 활용한다는 의미이다.
*/


/*
year라는 프로퍼티는 부모클래스인 BaseDate에 소속되어 있다. 그리고 BaseDate를 상속받은 childDate도 그대로 year 프로퍼티를 이어받았음을 알 수 있다.
*/


/*
BaseDate의 print()메소드는 ChildDate에서 그대로 상속받았다. 하지만 동작하는 것은 childDate의 오버라이드된 .name 프로퍼티를 이용한다.
그래서 아무런 수정이 없었음에도 부모와 동작이 다르다.
*/


/*
스위프트는 단일 상속만 되는 언어이다. 상속받을 부모클래스 이후에 콤마로 무언가를 적는 것은 프로토콜을 명시하는 것이니 주의 필요.
*/








class yourDate : BaseDate {
    var hour = 0
    var minute = 0
    var second = 0
    override var name: String {
        return super.name + " \(self.hour):\(self.minute):\(self.second)"
    }
    
    init(y: Int, m: Int, d: Int, hh: Int, mm: Int, ss: Int) {
        super.init(y: y, m: m, d: d)
        self.hour = hh
        self.minute = mm
        self.second = ss
    }
    
}


var someDate3 = myDate(y: 1999, m: 1, d: 9, isBC: false)
someDate3.print() // AC 1999-1-9

var anotherDate = yourDate(y: 2011, m: 2, d: 4, hh: 9, mm: 55, ss: 12)
anotherDate.print() // 2011-2-4 9:55:12

func printDate(dateInstance : BaseDate) {
    dateInstance.print()
}

printDate(dateInstance: someDate3) // AC 1999-1-9

printDate(dateInstance: anotherDate) // 2011-2-4 9:55:12


/*
printDate의 매개변수에 BaseDate를 상속받은 클래스 myDate와 yourDate 클래스의 인스턴스를 넣어서 실행

BaseDate의 print() 메소드를 호출하는 것 처럼 보이는 함수이지만, 각자의 .name을 참고로 다르게 동작.

각 자신 클래스 입장에서 print()라는 메소드가 실행된 것.
*/



/*

부모 클래스를 자식 클래스 인스턴스의 공통 타입으로 사용이 가능하다.

각 자식 클래스들은 부모 클래스 타입의 변수에도 대입이 가능하다.

하지만 부모 클래스 타입의 변수에 대입되었더라도 실제 인스턴스는 자식 클래스의 것이다.

*/
