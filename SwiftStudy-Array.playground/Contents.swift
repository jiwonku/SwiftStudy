import UIKit

var str = "Hello, playground"


/*
Array - 멤버가 순서를 가진 리스트 형태의 컬렉션 타입
Dictionary - 키와 값의 쌍으로 이루어진 컬렉션 타입
Set - 순서가 없고, 멤버가 유일한 것을 보장해 주는 컬렉션 타입
*/


let arr1 : Array<Int> // 상수형 정수 배열
var arr2 : Array<String> // 변수형 문자열 배열



//단축 문법
//Array<type> -> [type]

let array1 : [Int]
var array2 : [String]



/*
 형식 추론(타입 유추)
 배열의 타입을 명시하지 않아도 되지만, 빈 배열을 만들 경우에는 타입을 반드시 명시해야 합니다.
 
*/

let arrr1 = [1,2,3,4,5]
var arrr2 = ["a","b","c","d","e"]

//컴파일러(Apple LLVM/Clang)가 배열에 들어가는 값이 무엇인지 타입 추론을 하여 결정함.


//let emptyArr = [] // 빈 배열에 타입을 명시하지 않았기 때문에 에러 발생.

//let diffValueArr = [1, "z", 2, "r"] // 다른 타입의 값을 한번에 넣으면 에러 발생.




let emptyArray : [Int] = []

//정식 문법
let emptyArray2 : Array<Int>

//단축 문법
let emptyArray3 = [Int]()






// 값 넣기
// 대입 연산자 '=' 뒤에는 대괄호 사이에 배열의 타입과 일치하는 값을 넣어줘야 합니다.

//정식 문법
let strArray1 : Array<String> = ["a" , "b"]

//단축 문법
let strArray2 : [String] = ["a" , "b"]

//형식 추론
let strArray3 = ["a","b"]

//시퀀스
let nums = Array(1...3) // [1,2,3]

// 여러 자료형(타입)
let anyArr : [Any] = [1,2, "three" , "four"] // [1,2,"three","four"] // 한 배열 안에 여러 타입의 값을 넣고 싶다면 'Any'를 사용하면 된다.








// 크기가 정해진 배열을 만들 수 있음.

let zeroArray1 = [Int](repeating: 0, count: 10) // [0,0,0,0,0,0,0,0,0,0]
 
let zeroArray2 = Array(repeating: 0, count: 10) // [0,0,0,0,0,0,0,0,0,0]

// repeating : 배열의 타입과 일치하는 값(1개), count: 값을 반복할 횟수)

// zeroArray1 , zeroArray2는 완전히 동일함.

// 범위 연산자는 특정 범위 내에서 1씩 증가한 값이 배열에 넣어지지만, Arrya(repeating:count:) 메소드는 반복할 값 1개(repeating)가 지정된 횟수(count)만큼 배열에 넣어집니다.










let nums2 = [1,2,3]
let emptyArr : [Int] = []


//.count 로 배열의 크기(들어있는 값의 개수) 확인이 가능
nums2.count // 3
nums2.count == 0 // false


//.isEmpty로 배열에 값이 있는지 여부를 체크 가능
nums2.isEmpty // false
emptyArr.isEmpty // true








// 배열의 인덱스는 0부터 시작.
// 즉, 하기 배열에서 apple의 인덱스는 0

let fruits = ["apple" , "orange" , "grape"]

let numbers = [1,2,3,4,6]
//             0,1,2,3,4     //  numbers의 인덱스는 이와 같다. 1의 인덱스는 0 , 3의 인덱스는 2 , 6의 인덱스는 4


fruits[0] // "apple"
fruits[1] // "orange"
fruits[2] // "grape"





// 서브 스크립트 : 내가 원하는 값을 쉽게 찾기 위해서 정의하는 문법 ex: fruits[0]

fruits[0...1] // ["apple", "orange"]

fruits[fruits.startIndex] // "apple"

fruits.endIndex // 3 => fruits는 값이 세개인데, 인덱스가 3이면 배열에서는 4번째 인덱스를 가리키는 값이니 endIndex는 배열의 마지막 인덱스가 아닌 것을 알 수 있다.
// endIndex는 마지막 인덱스의 다음 인덱스.

fruits[fruits.index(before: fruits.endIndex)]



//배열의 시작과 마지막 인덱스에 접근할 때는 속성을 사용할 수 있음.

fruits.first // "apple"
fruits.last // "grape"

// 배열이 비어있다면 nil을 반환.
emptyArr.first // nil
emptyArr.last // nil

//emptyArr[0] // 서브 스크립트를 사용하면 에러가 발생. , 배열에 값이 없는데 접근해서 값을 가져오려고 했기 때문.

























