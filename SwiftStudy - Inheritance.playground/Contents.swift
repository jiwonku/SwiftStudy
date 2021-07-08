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







class Car : Vehicle {
    var gear = 1
    
//    override var currentSpeed: Double = 2.0 // 에러를 발생시킨다. 프로퍼티는 저장프로퍼티로 override를 할 수 없기 때문.
    
    //하지만 하기와 같이 부모의 프로퍼티를 자식에서 연산 프로퍼티로 override는 할 수 있다.    
    override var currentSpeed: Double {
        get{
            return 1.0
        }
        set{
            gear = Int(super.currentSpeed)
        }
    }
    
    override var description: String { // 오버라이드 하려는 연산 프로퍼티의 이름과 타입을 명시해줘야 한다
        return super.description + " in gear \(gear)"
    }
}

var car = Car()
print("Car : \(car.description)") // Car : traveling at 0.0 miles per hour in gear 1
car.currentSpeed = 25.0
car.gear = 3
print("Car : \(car.description)") // Car : traveling at 25.0 miles per hour in gear 3
