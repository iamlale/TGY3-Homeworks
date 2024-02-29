import UIKit

/* Euler projects Question 6
 The sum of the squares of the first ten natural numbers is 1^2 + 2^2 + ... + 10^2 = 385
 The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)^2 = 55^2 = 3025
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */

func sumOfSquares (number: Int) -> Int {
    let firstPart = number * (number + 1) //((n)(n+1)(2n+1))/6
    let secondPart = (2 * number + 1)
    return (firstPart*secondPart)/6
}

func squareOfSum (num: Int) -> Int {
    let formula = (num*(num+1))/2  // ((n)(n+1))/2
    return formula*formula
}
let naturalNum = 100
print("The difference between the sum of the squares of the first one hundred natural numbers and the square of the sum is \(squareOfSum(num: naturalNum)-sumOfSquares(number: naturalNum))")


