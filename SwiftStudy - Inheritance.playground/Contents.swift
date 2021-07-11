import UIKit

var greeting = "Hello, playground"


/*
 상속 :
 클래스에만 있고, 구조체에는 없다.
 자식 클래스가 부모 클래스로부터 기능을 불려받는 것.
 승계해 주는 클래스 : 부모/슈퍼/상위 클래스
 승계를 받는 클래스 : 자식/서브/하위 클래스
 상속 받은 클래스도 새로운 자식 클래스에게 상속 가능하다.
 단일 상속만 가능하다(여러 부모에게서 상속받을 수 없다는 의미. 즉, 어떤 클래스의 부모 클래스는 하나만 존재할 수 있다)
 문법 구조
 */



class Vehicle {
    var currentSpeed = 0.0
    var description : String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("this is basic vehicle")
    }
    
    final func makeSecretNoise(){
        
    }
}


class Bicycle : Vehicle {
    var hasBasket = false; // 모든 자전거에 바구니가 있는 것은 아니니 초기값은 false
}

// 2인승 자전거
class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

var tandem = Tandem() // tandem 인스턴스는 Bicycle, Vehicle의 모든 프로퍼티와 메소드를 상속했기에 접근이 가능하다.






class Train : Vehicle {
    override func makeNoise() {
        print("Choo Choo")
        super.makeNoise() // this is basic vehicle
    }
}

var train = Train()
train.makeNoise() // Choo Choo






/*
 오버라이딩 : 프로퍼티 오버라이딩은 상위 클래스의 기능을 하위 클래스가 확장, 또는 변경하는 방식으로 진행되어야 하며 제한하는 방식으로 진행되어서는 안된다.
 */


class Car : Vehicle {
    var gear = 1
    
//    override var currentSpeed: Double = 2.0 // 에러를 발생시킨다. 프로퍼티는 저장프로퍼티로 override를 할 수 없기 때문.
        
    override var description: String { // 오버라이드 하려는 연산 프로퍼티의 이름과 타입을 명시해줘야 한다
        return super.description + " in gear \(gear)"
    }
}

var car = Car()
print("Car : \(car.description)") // Car : traveling at 0.0 miles per hour in gear 1
car.currentSpeed = 25.0
car.gear = 3
print("Car : \(car.description)") // Car : traveling at 25.0 miles per hour in gear 3


class Car2 : Vehicle {
    var gear = 0
    var engineLevel = 0
    
    //부모의 프로퍼티를 자식에서 연산 프로퍼티로 override는 할 수 있다.
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            // set 구문에서 아무것도 하지 않지만, 제거해서는 안된다. 상위 클래스의 저장 프로퍼티를 오버라이딩 할 때는 일고 쓰기가 모두 가능하게 만들어야 한다.
        }
    }
    
    override var description: String {
        get {
            return "Car : engineLevel = \(self.engineLevel), so currentSpeed is \(self.currentSpeed)"
        }
        set {
            print("new value is \(newValue)")
        }
    }
}

let c = Car2()

c.engineLevel = 5
c.currentSpeed // 250
c.description = "new class car" // new value is new class car

print(c.description) // Car : engineLevel = 5, so currentSpeed is 250.0




class AutomaticCar : Car2{
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10) + 1
        }
    }
}



/*
 메소드 오버라이딩 : 매개변수 타입이나 반환타입이 상위 클래스의 메소드와 동일해야 한다.
 이는 스위프트가 메소드 오버로딩을 지원하기 때문.
 */

class Bike : Vehicle {
    override func makeNoise() {
        super.makeNoise() // this is basic vehicle
        print("aaaaa") // aaaaa
    }
    
//    override func makeSecretNoise () { // 상위 클래스에서 final로 선언했기 때문에 오버라이딩을 하면 빌드 에러가 발생한다. / 보통 더는 수정하거나 기능을 변경하기를 원치 않을 때 사용한다.
//
//    }
}

let bk = Bike()
bk.makeNoise()
