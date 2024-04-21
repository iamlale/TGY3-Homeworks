import UIKit
import Foundation

var greeting = "Hello, playground"

//TUPLE

let tuple = (404, "not found")
print(tuple)
print(tuple.0)
print(tuple.1)

// ISIMLI TUPLE
var namesTuple = (first: 1, middle: 2, last: 3)
print(namesTuple.first)
print(namesTuple.self)

// SONRADAN DEGER BELIRLENEN TUPLE

var numberTuple: (optionalFirst: Int?, middle: String, last: Int)?

numberTuple = (nil, "lale", last: 21)
numberTuple?.last

//SORU: MERKEZI (0,0) OLAN VE YARICAPI 1 OLAN CEMBER TANIMLAYINIZ

typealias Circle = (center: (x: CGFloat, y: CGFloat), radius: CGFloat)
let unitCircle: Circle = ((0.0, 0.0), 1)
unitCircle.center.x

var a1 = 3
var b1 = 4
(a1, b1) = (b1, a1) // a1 = 4, b1 = 3
print(a1, b1)

//TUPLES IN SWITCH
let switchTuple = (firstCase: true, secondCase: false)

switch switchTuple {
    
case (true, true):
    print("ikisi de dogru")
case (true, false):
    print("ilki dogru, ikinci yanlis")
case (false, true):
    print("ilki yanlis, ikincisai dogru")
case (false, false):
    print("ikisi de yanlis")
    
}

//------------------------------------------------------------------------

/*ARRAY - DIZI
 AYNI VERI TURUNDE OLAN DEGERLERI TUTAR ANCAK DILENIRSE FARKLI TURLERI BIRLIKTE TUTABILIRIZ
 */

var cars = ["Dacia", 19] as [Any]

var cities: [String] = [] //BOS STRING ARRAYI
var anotherCities: Array<String> = Array() //BOS STRING ARRAYI
var anotherCities2 = Array<String>() // BOS STRING ARRAYI
var anotherCities3 = [String]() // BOS STRING ARRAY

//ARRAY'E ELEMAN EKLEME VE INDIS KAVRAMI
cities.append("Malatya")
cities.append("Sinop")
cities.append("Bursa")
cities.append("Baku")
cities.append("Kahramanmaras")
cities.append("Denizli")
cities.append("Canakkale")
cities.append("Tekirdag")
cities.append("Hatay")

cities.first
cities[0]
cities.endIndex
cities.last
cities[cities.endIndex - 1]
cities[cities.count - 1]

var stringArray = Array(repeating: "Malatya", count: 4)

// ARRAY IN ARRAY
let matrix = [["a", "b", "c"] , [1, 2, 3]]
matrix[0][2]
matrix.first?.last

//NUMERICAL ARRAYS
var numberArray = [1, 2, 3]
numberArray.max()
numberArray.min()

for city in cities {
    print(city)
}
