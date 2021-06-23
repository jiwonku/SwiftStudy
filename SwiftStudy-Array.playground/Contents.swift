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

/*
 서브 스크립트로 접근하면 반환형이 non-optional type 임.
 따라서 만약 해당 index에 해당하는 값이 없으면 에러가 발생.
 First, last란 속성을 사용하면 반환형이 optional type이라서 만약 값이 없으면 에러가 아닌 nil을 리턴함.
 */






/*
 배열에 요소 추가하기
 */


// 끝에 추가
var addArray = [1,2,3]
addArray.append(4) // [1, 2, 3, 4]
addArray.append(contentsOf: [5,6,7]) // [1, 2, 3, 4, 5, 6, 7]


// 중간에 추가
var addArray2 = [1,2,3]
addArray2.insert(0, at: 0) // [0, 1, 2, 3]
addArray2.insert(contentsOf: [10, 100], at: 2) // [0, 1, 10, 100, 2, 3]


// contents of 를 사용하면 배열에 배열을 추가할 수 있음.


/*
 위에서 보면 append, insert 모두 배열에 값을 추가할 수 있는데, insert는 위치까지 지정할 수 있으니 insert가 더 유용해 보이지만
 append는 끝에 추가, insert는 중간에 추가 이기 때문에 내부적으로 동작이 다름.
 183, 184 라인의 append는 addArray 배열의 1,2,3 값들은 변경이 없어도 되고 배열의 마지막 위치에 값들이 추가만 되면 된다.
 그런데 얘를 들어 189 라인의 insert 동작은 0번째 인덱스, 즉 배열의 처음 위치에 값을 넣는 것이기 때문에 기존에 배열에 포함되어 있던 값들의 인덱스 재배치가 발생하게 됨.
 
 하기와 같은 값과 인덱스에서
 값    : 1 2 3
 인덱스 : 0 1 2
 
 하기와 같이 바꿔주고
 값    :   1 2 3
 인덱스 : 0 1 2 3
 
 하기와 같이 처음 위치(0번째 인덱스)에 '0' 을 넣어줌.
 값    : 0 1 2 3
 인덱스 : 0 1 2 3
 
 즉, insert는 대체적으로 append에 비해 오버헤드가 많이 발생하게 됨.
 중간에 삽입해야 하는 경우라면 어쩔 수 없겠지만, 그게 아니라면 append를 쓰는 것을 권장한다.
 
 */










/*
 배열의 값 변경하기
 */

var changeArray = [1,2,3]
changeArray[0] = 10 // 10,2,3
changeArray[0...2] = [10,20,30] // [10, 20, 30]
changeArray[0...2] = [0] // [0]
changeArray[0..<1] = [] // []


var changeArray2 = [1,2,3]
changeArray2.replaceSubrange(0...2, with: [10,20,30]) // [10, 20, 30]
changeArray2.replaceSubrange(0...2, with: [0]) // [0]
changeArray2.replaceSubrange(0..<1, with: []) // []








/*
 배열 값 삭제하기
 */

var removeArray = [1,2,3,4,5,6,7,8,9]

removeArray.remove(at: 2) // [1, 2, 4, 5, 6, 7, 8, 9] // 해당 인덱스의 값 삭제
removeArray.removeFirst() // [2, 4, 5, 6, 7, 8, 9] // 첫 번째 인덱스의 값 삭제
removeArray.removeFirst(2) // [5, 6, 7, 8, 9] // 첫 번째 인덱스 값 부터 파라미터로 받은 만큼 삭제
removeArray.removeLast() // [5, 6, 7, 8] // 마지막 인덱스의 값 삭제 , 리턴값이 non optional type = 마지막 값이 없을 경우 에러 발생
removeArray.popLast() // [5, 6, 7] // 마지막 인덱스의 값 삭제 , 리턴값이 optional type = 마지막 값이 없을 경우 nil을 리턴하고 에러 발생하지 않음.
removeArray.removeLast(2) // [5] // 마지막 인덱스 값 부터 파라미터로 받은 만큼 삭제
removeArray.removeAll() // [] // 전체 값 삭제


var removeArray2 = [1,2,3,4,5,6,7,8,9]

removeArray2.removeSubrange(1...3) // [1, 5, 6, 7, 8, 9] // 파라미터로 받은 인덱스 값 삭제
removeArray2[0..<2] = [] //


// remove 역시 마지막 요소를 삭제하는 것이 아니면 insert와 마찬가지로 오버헤드가 발생한다.








// 배열 비교 : 모든 요소가 같아야지만 true

var compareArray1 = [1,2,3]
var compareArray2 = [1,2,3]
var compareArray3 = [1,2,3,4,5]
var compareArray4 = [1,2,4]

compareArray1 == compareArray2 // true
compareArray1 == compareArray3 // false
compareArray1 == compareArray4 // false







/*
 배열 값 검색하기
 */

var serchArray = [1,2,3,4,5,6,7,8,9]

// 해당 값이 배열에 존재하는지 Bool로 리턴
serchArray.contains(1) // true
serchArray.contains(10) // false


// contains + 클로저 : 직접 검색 구도를 구현 ( 짝수가 하나라도 있으면 true)
serchArray.contains { num in  // true
    num % 2 == 0
}

// first + 클로저 : 클로저의 조건을 만족하는 가장 첫 번째 요소의 "값"을 리턴, 없다면 nil을 리턴
serchArray.first { num in // 2
    num % 2 == 0
}

// firstIndex + 클로저 : 클로저의 조건을 만족하는 가장 첫 번째 요소의 "Index"을 리턴, 없다면 nil을 리턴
serchArray.firstIndex{ num in  // 1
    num % 2 == 0
}

// last + 클로저 : 클로저의 조건을 만족하는 가장 마지막 요소의 "값"을 리턴, 없다면 nil을 리턴
serchArray.last { num in // 8
    num % 2 == 0
}

// lastIndex + 클로저 : 클로저의 조건을 만족하는 가장 마지막 요소의 "Index"을 리턴, 없다면 nil을 리턴
serchArray.lastIndex { num in // 7
    num % 2 == 0
}







/*
 배열 정렬하기
 */

var arrangeArray = [1,3,9,7,2,5]

// 	배열을 오름차순으로 정렬
arrangeArray.sort() // [1, 2, 3, 5, 7, 9]

// Sort + 클로저 : 배열을 내림차순 혹은 오름차순으로 정렬
arrangeArray.sort(by: > ) // [9, 7, 5, 3, 2, 1]

// 원본은 그대로 두고 오름차순으로 정렬된 새로운 배열을 만들어서 리턴 & arrangeArray2에 해당 배열을 넣어줌
let arrangeArray2 = arrangeArray.sorted() // [1, 2, 3, 5, 7, 9]

// Sort + 클로저 : 원본은 그대로 두고, "내림차순 혹은 오름차순"으로 정렬된 새로운 배열을 만들어 리턴 & arrangeArray3에 해당 배열을 넣어줌
let arrangeArray3 = arrangeArray.sorted(by: > ) // [9, 7, 5, 3, 2, 1]



/*
 스위프트 함수 중에 -ing , -ed 등이 붙는 것들은 원본을 건드리지 않고 작업이 완료된 새로운 것을 리턴함.
 위에서 sort는 원본을 직접 건드리는 것이고, sorted는 원본을 바꾸지 않고 정렬된 새로운 배열을 리턴.
 */








// 원하는 위치의 값들을 변경하기.
var swapArray = [1,2,3,4,5]
swapArray.swapAt(0, 4) // [5, 2, 3, 4, 1]
swapArray.swapAt(1, 4) // [5, 1, 3, 4, 2]







// 배열 무작위로 섞기
var shuffleArray = [1,2,3,4,5]
shuffleArray.shuffle()
