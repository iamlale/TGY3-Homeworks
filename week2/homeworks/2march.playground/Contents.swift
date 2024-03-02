import UIKit

var greeting = "Hello, playground"

// 2 parametreli ve farklı tipli bir generic örneği yapınız
//ODEV HESAP MAKINESI REFACTOR.

/* Euler 7 - By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13. What is the 10001st prime number? */

/*func isPrime(_ number: Int) -> Bool {
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

    // 5ten baslayarak karekoküne kadar 6n ± 1 formundaki sayılara bölünüp bölünmediğini kontrol eder
    var i = 5
    while i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        }
        i += 6
    }

    return true
}

func findPrime(position: Int) -> Int {
    var count = 0
    var num = 1
    while count < position {
        num += 1
        if isPrime(num) {
            count += 1
        }
    }
    return num
}

let prime10001 = findPrime(position: 10001)
print("The 10001st prime number is \(prime10001)")  //104743 */



// 2 parametreli ve farklı tipli bir generic örneği yapınız

func combine<T, U>(key: T, value: U) -> String {
    return "\(key): \(value)"
}

let result1 = combine(key: "Age", value: 30)
print(result1)

let result2 = combine(key: "Pi", value: 3.14)
print(result2)

let result3 = combine(key: 1, value: "One")
print(result3)





enum CalculateError: Error {
    case nanError // 0 / 0
    case infError // number / 0
    case baseError // 0 / sayi
}

func division(dividend: Double, divisor: Double) throws -> Double {
    guard !(dividend == 0 && divisor == 0) else {
       // print("NaN Error")
        throw CalculateError.nanError
    }
    
    guard divisor != 0 else {
        //print("Inf Error")
        throw CalculateError.infError
    }
    
    guard dividend != 0 else {
        throw CalculateError.baseError
    }
        
    return dividend / divisor
}

do {
    let result = try division(dividend: 0, divisor: 5)
    print(result)
} catch {
    print(error)
}
