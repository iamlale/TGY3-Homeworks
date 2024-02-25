import UIKit

/*
 1 - Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun stringler olsun. Bu stringler içinde bazı harflerin tekrar edeceğini düşünün. Mesela 'a' harfi 20 farklı yerde geçiyor olabilir. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfleri siliniz.Sonra geriye kalan stringi ekrana yazdırınız.
  
  Örnek string: "aaba kouq bux"
  Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazılmalı
  Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
  tekrar sayısı 4 verildiğinde : hiç bir harf silinmeyip aynı string yazılmalı

 */

func removeRecurringCharacters(from string: String, withThreshold threshold: Int) -> String {
    var charCounts = [Character: Int]()
    
    // stringdeki karakterlerin her birinden kac tane oldugunu yaz
    for char in string {
        if char.isLetter {
            charCounts[char, default: 0] += 1
        }
    }
    
    // thresholdu aşan karakteri sil
    var newString = ""
    for char in string {
        if let count = charCounts[char], char.isLetter, count < threshold {
            newString.append(char)
        } else if !char.isLetter {
            newString.append(char)
        }
    }
    
    return newString
}

let inputString = "aba kouq bux"
let threshold = 2
//print(removeRecurringCharacters(from: inputString, withThreshold: threshold))



/*
 
 2- Elimizde uzun bir cümle olsun. Bazı kelimelerin tekrar ettiği bir cümle düşünün. İstediğimiz ise,
 hangi kelimeden kaç tane kullanıldığını bulmak.
 String = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
 Merhaba 1 kere, nasılsınız 2 kere iyiyim 2 kere 
 
 */

func findWordsCount(in string: String) -> [String: Int] {
    
    var wordCounts = [String: Int]()
    
    //cumleyi kelimelere ayirma
    let words = inputSentence.components(separatedBy: " ")
    
    //her kelimenin kac kez tekrar ettigini say
    for word in words {
        wordCounts[word, default: 0] += 1
    }
    return wordCounts
}

let inputSentence = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
let wordOccurrences = findWordsCount(in: inputSentence)
print(wordOccurrences)

/*

Euler project (https://projecteuler.net/archives) sayfasındaki ilk 3 soru swift kullanılarak çözülmeli


homework 1 klosorunde sorulara cevap yazin
*/
