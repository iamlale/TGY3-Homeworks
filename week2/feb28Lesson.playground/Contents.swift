import UIKit

//SET UNORDERED
/*
 ARRAY VE SET ARASINDAKI FARK NEDIR?
 1 - SETLERDE MUKERRER ELEMAN BULUNMAZ ARRAYLERDE BULUNABILIR
 2 - ARRAYLER SIRALI SETLER SIRASIZ OLUR
 3 - SETLER HASHABLE PROTOKOLUNE SAHIPTIR. (ARASTIRMA ODEVI)
 */

var colors = Set<String>() // elemanlari string olan bos bir set
var myColors: Set<String> = ["yesil", "siyah", "mavi", "turkuaz", "kirmizi"]
myColors.count

var animals: Set<String> = ["Cakil", "Karabas", "Luna", "Tony", "Mavis", "Cimen", "ercucu", "Atiba", "Maya", "Beyaz", "Albino", "Kara"]
var myCars: Set<String> = ["Clio", "corolla", "tesla", "bmw", "kartal", "Dogan", "sahin", "serçe"]
var wildBirds: Set<String> = ["Kartal", "Şahin", "Marti", "Dogan", "Akbaba"]

//intersection
var interSection1 = myCars.intersection(wildBirds)

//union
var union1 = myCars.union(wildBirds)

/* HOMEWORKK
 bir sinifta en az bir yazilim bilenlerin sayisi 24,
 sadece swift 12, sadece kotlin 8, olduguna gore her iki dili bilen kac kisi vardir*/

var kotlin: Set<String> = ["a", "b", "c", "d", "e", "f", "g", "h", "l", "m", "n", "k"]
var swift: Set<String> = ["1", "2", "3", "4", "5", "6", "7", "8"]

/*
 symmetric difference: fark
 substracting: altkume
 */

/*Dictionary Unordered
 1 - key-value formatli veri yapisidir
 */

var dict1: Dictionary<String, String> =  Dictionary<String, String>()
var dict2 = [String: String]()
var dict3: [String: String] = [:]

var hayvanlar: [String: String] = ["Cakil" : "Kedi", "Zilli" : "Kopek", "Beyaz" :  "Sibirya Kurdu"]
print(hayvanlar)
hayvanlar.keys //cskil, zilli
hayvanlar.values //kedi, kopek
hayvanlar["Cakil"] = "Kus"
print(hayvanlar)
hayvanlar.updateValue("Kus", forKey: "Cakil")

var plates: [Int: String] = [31: "Hatay", 34: "Istanbul", 35: "Izmir", 44: "Malatya"]
var testDict1 = [String: Any]()

for hayvan in hayvanlar.keys {
    print(hayvan)
}

/*FONKSIYONLAR
 */

func sayHi() {
    print("Hello World!")
}
sayHi()

func sayHi2(name: String) {
    print("Hello ", name)
}
sayHi2(name: "Lale")


func greeting(name: String) -> String {
    return "Hello \(name)"
}
greeting(name: "Kerim Hoca")

func greeting(name: String, age: Int) -> String {
    return "Hello my name is \(name), and I am \(age) years old"
}
greeting(name: "Lale", age: 22)

// bir fonksiyon kac parametre dondurebilir? --
func anything() -> (a: Int, b: Int, c:Int) {
    return (1, 2, 3)
}

//VARIADIC FONKSIYON - KAC TANE PARAMETRE ALACAGI BELLI DEGIL
func sumVariadic(numbers: Int..., y: String) {
    print("\(y): \(numbers)")
}
sumVariadic(numbers: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, y: "my numbers")

func value(x: inout Int) {
    x = 5
    x += 1
    print(x)
}
var x = 4 //inout bu erroru cozuyor
value(x: &x)

//##################################################################
/*
 CLOSURES - BLOCK - LAMDA - ARROW FUNCTION (OK FONKSIYONU)
 
 ISMI OLMAYAN, PARAMETRE ALIP GERIYE DEGER DONDUREBILEN, BIR DEGISKENE ATANABILEN, BIR FONKSIYONA PARAMETRE OLARAK VERILEBILEN
 KOD BLOGUNA DENIR
 */

// () -> () HICBIR SEY ALMAYIP HICBIR SEY DONDURMEYEN, () -> void

let selamVer: () -> () = {
    print("Selam!")
}
selamVer()

// isim parametresi alan closure (String) -> ()
let selamVer2: (String) -> () = { name in
    print("Selam \(name)")
}
selamVer2("Lale")

// birden fazla parametre alan ve donus tipi olan closure (Int, Int) -> (Bool)
let compare: (Int, Int) -> Bool = { x, y in
    return x < y
}
compare(4, 5)

let sumOfNums: (Int, Int) -> Int = { a, b in
    return a + b
}

let names = ["osman", "cem", "yusuf", "Oguzhan", "kerem", "Ayca"]
let sortedNames = names.sorted { (x: String, y: String) -> Bool in
    return x < y
}

let sortedNames2 = names.sorted { (x, y) -> Bool in
    return x < y
}

let sortedNames3 = names.sorted { x, y in
    return x < y
}

let sortedNames4 = names.sorted {
    $0 < $1 //ilk ve ikinci parametreleri temsil ediyorlar sirasi ile
}

let sortedNames5 = names.sorted(by: <) // hocanin tercihi

/*COMPLATION HANDLER
1 - (MUHTEMELEN EN COK KULLANACAGINIZ CLOSURE TURUDUR)
2 - http istegi gibi uzun bir islem yapmak istedigimizi varsayalim. istegin tamamlanmasinin hemen ardindan bir seyler yapmak isteyelim. Ancak surecin devam edip etmedigini birden cok kez kontrol etmek bizim icin maliyetli olacaktir. Bu durumda isimizi giren complation handler bu uzun islem tamamlanir tamamlanmaz geri cagirilan closuredur
*/
