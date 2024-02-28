var greeting = "Hello, playground"
print(greeting)
greeting="merhaba dunya"
print(greeting)  //farkli degerleri var degiskenine atayabiliriz

let selamlama="merhaba" //apple reccomend let

let paragraf = """
hello world
hahha dnkjckcb ncknkc ndkjnknc
"""
print(paragraf)

let cümle = "kerim"
print(cümle) //turkce karakter destekliyor

let pi=3.14
print(pi)

let icon="\u{1f44d}"
print(icon)

let icon2="\u{2764}"
print(icon2)

var x = 3
var y: Double = 3
var z: Int = Int(3.0)
print(x)
print(y)
print(z)
print("swift versiyonun \(z)")

let b: Character = "b"
print(type(of: b))

//tek satirli command

/*cok
 satirli
 command
 olusturma*/

//BACKEND'E ASLA GUVENME
var name: String? //nil tanimlama
//print(name ?? "noname")
name="Songul"
//print(name!) //kesin name var ise ! kullaniriz crash olmasin diye
//print(name as Any) //output:nil sadece uyari verir

name?.count

var version=15
var myVersion=12

if myVersion > 14 {
    print("swiftUI rahatlikla yazilabilir")
} else if myVersion == 13 {
    print("swiftUI yazilabilir")
} else {
    print("swiftUI yazabilmek icin en az 13 gerekir")
}

myVersion > 14 ? print("swiftUI rahatlikla yazilabilir") : print("swiftUI yazabilmek icin en az 13 gerekir")

/*
 Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun stringler olsun. Bu stringler içinde bazı harflerin tekrar edeceğini düşünün. Mesela 'a' harfi 20 farklı yerde geçiyor olabilir. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfleri siliniz.Sonra geriye kalan stringi ekrana yazdırınız.
  
  Örnek string: "aaba kouq bux"
  Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazılmalı
  Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
  tekrar sayısı 4 verildiğinde : hiç bir harf silinmeyip aynı string yazılmalı

 
 
 2- Elimizde uzun bir cümle olsun. Bazı kelimelerin tekrar ettiği bir cümle düşünün. İstediğimiz ise,
  hangi kelimeden kaç tane kullanıldığını bulmak.
  String = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
  Merhaba 1 kere, nasılsınız 2 kere iyiyim 2 kere
 
 
 Euler project (https://projecteuler.net/archives) sayfasındaki ilk 3 soru swift kullanılarak çözülmeli

 
 homework 1 klosorunde sorulara cevap yazin
 
 */
