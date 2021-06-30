import UIKit

var str = "Hello, playground"



let animalArray = ["pig" , "monkey" , "cow" , "tiger"]


for animal in animalArray {
    print("\(animal)")
}


for animal in animalArray {
    switch animal {
    case "pig":
        print("pig")
    case "monkey":
        print("monkey")
    case "cow":
        print("cow")
    default:
        print("default")
    }
}


func selectAnimal(animal : String) {
    
    switch animal {
    case "pig":
        print("pig")
    case "monkey":
        print("monkey")
    case "cow":
        print("cow")
    default:
        print("It is not included")
    }
}


for animal in animalArray {
    selectAnimal(animal: animal)
}

//selectAnimal(animal: "pig") // pig
//
//selectAnimal(animal: "monkey") // monkey
//
//selectAnimal(animal: "ant") // It is not included




let nums : [Int] = [1,2,3,4]

for num in nums {
    print(num)  //  1 2 3 4
}


nums.forEach {
    print($0) //  1 2 3 4
}


var i : Int = 0
var result : Int = 0

while i < nums.count {
    result += nums[i] // result = result + nums[i]
    i += 1
}

print("total sum is \(result)") // total sum is 10





func checkNum(num : Int) {
    
    guard num > 2 else {
        print("not bigger than 2")
        return;
    }
    
    print("bigger than 2")
}

for i in nums {
    checkNum(num: i)
}


