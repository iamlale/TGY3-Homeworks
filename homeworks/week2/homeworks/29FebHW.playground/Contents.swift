import UIKit

/*asal sayi test etme fonksiyonu*/

func isPrime(_ number: Int) -> Bool {
    // 2'den kucuk tüm sayılar asal değildir
    if number < 2 {
        return false
    }

    // 2 ve 3 asal sayılardır
    if number == 2 || number == 3 {
        return true
    }

    // cift sayılar ve 3'ün katları asal olamaz
    if number % 2 == 0 || number % 3 == 0 {
        return false
    }

    // 5ten baslayarak kareköküne kadar 6n ± 1 formundaki sayılara bölünüp bölünmediğini kontrol eder
    var i = 5
    while i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        }
        i += 6
    }

    return true
}

//isPrime(23)


func isPalindrome(_ input: Any) -> Bool {
    let str: String
    if let inputAsInt = input as? Int {
        str = String(inputAsInt)
    } else if let inputAsString = input as? String {
        str = inputAsString.lowercased() // hepsini kucuk harf yap
    } else {
        // string veya int degilse false dondur
        return false
    }
    
    // tersi ile kiyasla
    return str == String(str.reversed())
}

//isPalindrome(923329)


/*Swift yazan kişi sayısı 8. Kotlin yazan kişi sayısı 12. En az 1 dil bilen kişi sayısı 24 ise 2 dil bilen kişi sayısı kaçtır.*/
let swiftLearners: Set<String> = ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "D"]
let kotlinLearners: Set<String> = ["A", "B", "C", "D", "E", "F", "G", "H"]

let bothLearners = swiftLearners.intersection(kotlinLearners).count
//print(bothLearners)

