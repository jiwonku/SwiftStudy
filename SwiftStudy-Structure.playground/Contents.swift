import UIKit
import Darwin

var str = "Hello, playground"


/*
 구조체 : 인스턴스의 값(프로퍼티)을 저장하거나 기능(메소드)을 제공하고 이를 캠슐화 할 수 있는 스위프트가 제공하는 타입(named type)
 */


struct Location {
    let latitude : Double
    let longitude : Double
}

//위 선언한 구조체를 하기와 같이 선언 할 수 있다.
let pizzaLocation = Location(latitude: 44.5, longitude: -93.45)
// 구조체는 구조체 멤버를 패러미터 네임으로하여 스위프트가 자동으로 초기화 코드를 만들어 줍니다. 클래스와 차별되는 부분.


struct DeliveryRange {
    var range : Double
    let center : Location
}

let storeLocation = Location(latitude: 44.5, longitude: -93.45)
var pizzaRange = DeliveryRange(range: 200, center: storeLocation)
// 구조체는 다른 구조체를 멤버로 받을 수 있음


print(pizzaRange.range)
print(pizzaRange.center.latitude)
pizzaRange.range = 50 // 멤버에 접근해서 값 수정이 가능함 / range값을 수정할 수 있는 이유는 var로 선언했기 때문.




/*
 구조체도 초기화를 작성할 수 있음
 초기화 코드를 직접 정의하면 자동 초기화 코드는 저 이상 제공받지 못합니다.
 그럼에도 자동 초기화 코드가 필요하다면 직접 작성해야 합니다.
 초기화 코드는 원하는 만큼 만들수 있습니다.
 */
struct Location2 {
    let latitude : Double
    let longitude : Double
    
    init(coordinateString : String) {
        let crdSplit = coordinateString.split(separator: ",")
        latitude = atof(String(crdSplit.first!))
        longitude = atof(String(crdSplit.last!))
    }
}

let coords = Location2(coordinateString: "44.3 , -93.5")
print(coords.latitude)
print(coords.longitude)



/*
 초기화 규칙 : 모든 구조체 멤버(computed 프로퍼티 제외)는 초기값을 가져야 합니다.
 스위프트는 안정성에 초범을 둔 언어로 모든 멤버가 명시적으로 초기값을 가질 것을 요구합니다.
 단, 옵셔널 멤버는 제외 , 말 그대로 nil값을 가질 수 있는 멤버 변수 이므로.
 */

struct ClimateControl {
    var temperature : Double
    let humidity : Double?
    
    init(temp : Double) {
        temperature = temp
        humidity = 0;
    }
    
    
    //아래 예처럼 옵셔널 멤버도 값을 지정해 줄 수 있습니다.
    init(temp : Double , hum : Double) {
        temperature = temp
        humidity = hum
    }
}


//ClimateControl은 humidity 멤버의 값을 가질 수도, 혹은 아닐 수도 있습니다.

let ecoMode = ClimateControl(temp : 75.0)
let dryAndComfortabl = ClimateControl(temp: 71.0, hum: 30.0)

// 옵셔널 변수는 초기값으로 nil을 갖습니다. 따라서 옵셔널 멤버를 상수(let)로 선언한다면 값을 지정해야 합니다. 구조체가 만들어지고 난 다음에는 값을 변경하지 못 하니까요.
 
/*
 ClimateControl 에서 humidity를 let으로 바꾼다면 빌드에러가 발생합니다.
 첫번째 init에서 humidity를 초기화 하지 않았기 때문입니다.
 만약 humidity를 let으로 바꾸고 첫 번째 init 에서 humidity를 초기화 한다면 빌드에러가 발생하지 않습니다.
 */





struct ClimateControl2 {
    var temperature : Double = 68.0 //구조체를 선언하는 시점에 멤버 변수의 값을 지정할 수도 있습니다
    var humidity : Double?
}

//temperature 멤버가 초기값을 가지고 있기 때문에 패러미터 값을 생략할 수 있습니다.
let test = ClimateControl2()
