import UIKit

var str = "Hello, playground"

/*
 조건문 : 코드를 작성할 때, 어떠한 조건을 넣어 결과를 도출하고 싶을때 유용하게 사용하는 문법.
 */


/*
 if ~ else 조건문
 */

var temperatureNow = 30

if temperatureNow <= 32{
    print("whether is warm")
}else{
    print("whether is hot")
}



temperatureNow = 39

if temperatureNow <= 32{
    print("whether is warm")
}else if temperatureNow <= 39{
    print("whether is hot")
}else{
    print("do not go outside")
}



/*
 Question
 1. if ~ else로 if를 1번 사용하는 것과 if문을 따로 2번 사용하는 것의 차이점?
 2. if ~ else로 if 하나만 있을 때 else 없이 동일하게 처리하려면?
 */



//논리 연산자 and를 사용할 수 있는데, 다음과 같이 두 가지 방법으로 사용할 수 있다.

if(temperatureNow > 0) && (temperatureNow < 40){
    print("whether is hot")
}
if temperatureNow > 0, temperatureNow < 40{
    print("whether is hot")
}





/*
 switch case :
 => 가능한 모든 사례를 다루는 조건문.
 => 조건을 평가한다는 점에서 if ~ else와 유사하지만, switch는 다양하게 경우의 수를 나누어서 조건을 평가할 때 사용하면 유용하다.
 */

let a : Character = "z"

switch a{
case "a":                                       // 비교를 해야 하기 때문에 같은 타입의 값을 사용해야 함
    print("first character of alphabet")
//    (break)                                   // 사실 케이스가 일치하면 스위치 구문은 종료되기 때문에 각 case 마다 default에 있는 break가 생략되어 있다고 보면 된다.
case "z":
    print("last letter of alphabet")
default:                                        // 케이스가 모두 맞지 않을 경우 나오는 부분.
    break;                                      // break가 없으면 오류가 발생함. 왜냐하면 무조건 하나의 실행 결과가 나와야 하기 때문.
}



//간격을 주어 조건을 평가하는 것이 가능
let approxi = 77

switch approxi{
case 0...50:
    print("0...50")
case 51...100:
    print("51...100")
default:
    print("others")
}




// 조건의 개수를 여러개 입력 가능

let someCharacter : Character = "d"

switch someCharacter {
case "a","e","i","o","u":
    print("\(someCharacter) is vowel")
case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
    print("\(someCharacter) is consonant")
default:
    print("\(someCharacter) is not a alphabet")
}





// 밸류 바인딩

let stilAnotherPoint = (9,0) // Tuple

switch stilAnotherPoint {
case (let distance, 0):     // 아래 프린트 문에 값을 넣고 싶을때 밸류 바인딩을 써주면 됨. 'let + 변수명'
    print("on an axis, \(distance) from the origin")
default:
    print("not on an axis")
}




// 하기와 같이 표현 할 수도 있으나 케이스 안의 숫자가 바뀌면 조건 구문들도 바꿔줘야 하기 때문에 밸류 바인딩을 사용하는 것이 효율적.

switch stilAnotherPoint {
case (9,0):
    print("on an axis, 9 from the origin")
case (0,9):
    print("on an axis, 9 form the origin")
default:
    print("not on an axis")
}





// fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also"
    fallthrough  // 위 구문도 실행시키고, 그 다음도 항상 실행시키겠다 하면 fallthrough 사용.
case 4,6,8,10:
    description += " a ㅁㅁㅁㅁㅁ number, and also"
    
default:
    description += " an integer"
}

print(description)








/*
 guard 조건문 : guard 오른쪽의 조건이 false일 경우에 다음 {} 안의 코드가 실행된다.
 */

func update1(age:Int){
    guard 0...100 ~= age else{  // ~= : 범위 안에 포함되는지를 확인하는 연산자.
        print("else")           // guard 조건에 포함되지 않으면 else 실행.
        return
    }
    print("pass")
}

update1(age: 20)
update1(age: 102)




func update(age:Int){
    if 0...100 ~= age{
        print("OK")
    }
}

update(age: 40)




















