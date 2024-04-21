#!/usr/bin/env swift

import Foundation

var cities: [String] = ["Ankara", "Istanbul", "Izmir", "Bursa", "Yalova"]

print("Enter a number: ")

if let numberString = readLine(), let number = Int(numberString) {
	
    if number>0 && number <= cities.count {
	
	print ("Selected city: \(cities[number-1])")

    } else {
     
        print("Invalid number, please enter a number between 1 and \(cities.count)")
    }
  } else {
    print ("Invalid input, please enter valid number")

  }



