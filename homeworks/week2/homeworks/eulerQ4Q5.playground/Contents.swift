import UIKit
import Foundation


/* 
 Euler Q4
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91*99
 Find the largest palindrome made from the product of two 3-digit numbers.
 */

func isPalindrome(_ number: Int) -> Bool {
    let str = String(number)
    return str == String(str.reversed())
}

func findLargestPalindrome() -> (palindrome: Int, i: Int, j: Int) {
    var largestPalindrome = 0
    var foundI = 0
    var foundJ = 0
    
    for i in 100...999 {
        for j in i...999 {
            let product = i * j
            if isPalindrome(product) && product > largestPalindrome {
                largestPalindrome = product
                foundI = i
                foundJ = j
            }
        }
    }
    return (largestPalindrome, foundI, foundJ)
}

let result = findLargestPalindrome()
print("The largest palindrome made from the product of two 3-digit numbers is \(result.palindrome) = \(result.i) * \(result.j)") //906609


/*
 Euler Q5
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is *evenly divisible* (divisible with no remainder) by all of the numbers from 1 to 20?
 */

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b) //formula
}

func smallestDivisibleNum() -> Int {
    var lcmResult = 1
    for i in 2...20 {
        lcmResult = lcm(lcmResult, i)
    }
    return lcmResult
}

let result2 = smallestDivisibleNum()
print("The smallest positive number divisible with no remainder by all of the numbers from 1 to 20 is \(result2)") //232792560



