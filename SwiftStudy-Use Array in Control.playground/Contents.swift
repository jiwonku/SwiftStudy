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


selectAnimal(animal: "pig") // pig

selectAnimal(animal: "monkey") // monkey






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
    result += nums[i]    
    i += 1
}

print("total sum is \(result)")

