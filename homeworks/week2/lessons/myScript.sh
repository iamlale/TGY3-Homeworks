#!/usr/bin/env swift

import Foundation

print("Enter your name: ")

var name  = readLine(strippingNewline: true)
print("Hello \(name ?? "john doe")")
