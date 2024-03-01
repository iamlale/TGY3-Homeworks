import UIKit

/*Fonksiyona parametre olarak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yaınız.
 Örneğin 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde olmalıdır*/

/*func printPlusMinus(count: Int) {
    var output = ""
    for i in 0..<count {
        if i % 2 == 0 {
            output += "+"
        } else {
            output += "-"
        }
    }
    print(output)
}
printPlusMinus(count: 1)*/


 func printPlusMinus(count: Int) {
     var output = ""
     for i in 0..<count {
         output = output + ( i % 2 == 0 ? "+" : "-")
     }
     print(output)
 }

 // Example usage:
 printPlusMinus(count: 10)



/*Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını yanına koyunuz.
 Örneğin parametre 0 için çıktı 50 olmalıdır. Parametre 528 için 285, parametre 920 için 9520 olmalıdır*/

func insertFive(toMakeLargest number: Int) -> Int {
    let numStr = String(number)
    var maxNumber = Int.min
    
    // negatif sayilar icin
    if number < 0 {
        let absNumStr = String(abs(number))
        for i in 0...absNumStr.count {
            let startIndex = absNumStr.index(absNumStr.startIndex, offsetBy: i)
            let tempNumStr = absNumStr.prefix(i) + "5" + absNumStr.suffix(absNumStr.count - i)
            if let tempNum = Int(tempNumStr), -tempNum > maxNumber {
                maxNumber = -tempNum
            }
        }
    } else {
        for i in 0...numStr.count {
            let startIndex = numStr.index(numStr.startIndex, offsetBy: i)
            let tempNumStr = numStr.prefix(i) + "5" + numStr.suffix(numStr.count - i)
            if let tempNum = Int(tempNumStr), tempNum > maxNumber {
                maxNumber = tempNum
            }
        }
    }

    return maxNumber
}

print(insertFive(toMakeLargest: 150))
