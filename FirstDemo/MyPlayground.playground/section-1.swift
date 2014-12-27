// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str="aaa"
let no=1
//no=2
// varible with optional value


var OptionalString:String?="Optional String"


/// unwrapping Optional Values
if let uOptionalString = OptionalString {
    println(uOptionalString)
}
else {
    println("String is nil")
}




var personOne = "Steve"
var personTwo = "Tim"
//var combinedString = "\(personOne):Hello,\(personTwo)!"

var tipString = "2499"
var tipInt = tipString.toInt()
var combinedString = "\(personOne):Hello,\(personTwo):\(tipInt)!"



// Other Simple Numbers Examples

var mutablDouble:Double = 1.0
mutablDouble=2.0

let constantDouble:Double = 1.0
// constantDouble=2.0 /// Error cant update constant Value

var optionalDouble:Double? = nil
optionalDouble = 1.0



for i in 1...10 {
    
    i

}

let base = 3
let power = 10
var answer = 1

for _ in 1...power
{
    //answer*=base
}





////// Basic Class

class Person {
    
    var firstName:String!
    var lastName:String!
    
    var age:Int!
    
    func singSong(songName:String,artist:String){
    println("\(self.firstName) is singing \(songName) by \(artist)")
        
    }
    
}

let person = Person()
person.firstName = "Steve"
person.lastName = "Jobs"

person.age = 56

person.singSong("Dangerous", artist: "MJ")












