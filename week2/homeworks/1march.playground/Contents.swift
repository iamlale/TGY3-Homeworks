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
    // convert the input number to a string for easy manipulation
    let numStr = String(number)
    var maxNumber = Int.min // Initialize maxNumber with the smallest integer
    
    // find  range for insertion based on the number being positive or negative
    let range = number >= 0 ? 0...numStr.count : 1...numStr.count // Start from 1 for negative numbers to skip the '-' sign
    
    for i in range {
        // insert 5 at the current position i
        let newNumStr = numStr.prefix(i) + "5" + numStr.suffix(numStr.count - i)
        
        // convert new string back to an integer
        if let newNum = Int(newNumStr), newNum > maxNumber {
            // update maxNumber if  new number is larger
            maxNumber = newNum
        }
    }
    
    return maxNumber
}

print(insertFive(toMakeLargest: 0))
