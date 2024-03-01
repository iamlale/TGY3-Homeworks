import UIKit

/*COMPLATION HANDLER
1 - (MUHTEMELEN EN COK KULLANACAGINIZ CLOSURE TURUDUR)
2 - http istegi gibi uzun bir islem yapmak istedigimizi varsayalim. istegin tamamlanmasinin hemen ardindan bir seyler yapmak isteyelim. Ancak surecin devam edip etmedigini birden cok kez kontrol etmek bizim icin maliyetli olacaktir. Bu durumda isimizi giren complation handler bu uzun islem tamamlanir tamamlanmaz geri cagirilan closuredur
*/

//Alamofire kutuphane
//URLSession

/*let url = "https://gelecegiyazanlar.turkcell.com.tr"
let myURL = URL(string: url)

let handler: (Data?, URLResponse?, Error?) -> () = {data, response, error in
    print(String(data: data!, encoding: .utf8)!)
}

let task = URLSession.shared.dataTask(with: myURL!) { data, response, error in
    //print(String(data: data!, encoding: .utf8)!)
}
task.resume()

let task2 = URLSession.shared.dataTask(with: myURL!, completionHandler: handler)
task2.resume()*/

// non --escaping, @escaping  a sayfasinda yaptigin seyi b sayfasinda kullanmani sagliyor
// non- escaping: closures sadece kendi blogunda calisabilir, blol disinda calismaz
// non escaping kullaniyorsaniz compiler bu closure in kod blogu disinda calistririlmak istenmedigini bilir

// escaping : non escapingin tersidir. baska yerde cagirmak istedigimiz zaman @escaping kullnairiz. swiftte @escaping olarak isaretlenmezse baska yerde cagirilip kullaniliyri

/****
 ENUMS - ORTAK ozellikleri olan nesneleri toplamak icin kullanilir
 */

enum Direction {
    case right
    case left
    case top
    case bottom
}

enum Direktion2 {
    case right, left, top, bottom
}

let rightside = Direction.right
let leftSide = Direction.left

let bottomSide: Direction = .bottom

enum Numbers: Int {
    case first = 1, second, third, forth, fifth
}

let besinci = Numbers.fifth
print(besinci.rawValue)

enum Hata: Error {
    case sunucuHatasi(sebep: String)
    case kullaniciHatasi(sebep: String)
}
let hata = Hata.kullaniciHatasi(sebep: "Kullanici hatasi")
print(hata)

enum Cities: String {
    case Izmir = "Boyoz"
    case Hatay = "Kunefe"
    case Canakkale = "Peynir Helvasi"
    case Karabuk = "Lokum"
    case Malatya = "Kayisi"
    case Samsun = "Pide"
    case Tekirdag = "Hayrabolu tatlisi"
    case Erzurum = "Cag kebabi"
    case Bursa = "Sut helvasi"
    
}

let city = Cities.Tekirdag
print(city.rawValue)

func move(direction: Direction) {
    print("Oyuncu \(direction) yonunde hareket ediyor")
}

move(direction: .right)

let direct: Direction = .right

switch direct {
case .right:
    print("right")
case .left:
    print("left")
case .top:
    print("top")
case .bottom:
    print("bottom")
}

//nested enum kullanimi

enum Orchestra {
    
    enum String {
        case guitar
        case baglama
    }
    
    enum Keyboards {
        case piano
        case org
    }
    
    enum Percussion {
        case drum
        case bell
    }
}

let inst1 = Orchestra.Keyboards.piano
let inst2 = Orchestra.Percussion.drum
let inst3 = Orchestra.String.guitar

let solist = "Lale"

//Optionals
//Backende asla guvenme, degiskenleri optional tanimla
var number: Int?
number = 5
print(number ?? 0)

//if let kullanimi
if let sayi = number {
    print("number: \(sayi)")
} else {
    print("number was not assigned")
}

var sehir: String?
sehir = "Ankara"

if let sehir {
    print("my city \(sehir)")
}

//------------------------------
///
/// STRUCT
///
//------------------------------

struct Member {
    var name: String?
    var email: String?
    var password: String?
}

var member = Member(name: "Yigit", email: "yigit@gmail.com", password: nil)

func getMember(member: Member) {
    if let name = member.name, let email = member.email, let password = member.password {
        print(name)
        print(email)
        print(password)
    } else {
        print("Veriler okunamadi")
    }
}

getMember(member: member) //password nil oldugu icin else dusuyor

//guard let.... else {....}
func uyeGetir(uye: Member) { //hatayi yakalam odakli calisiyor, ustekinde ben bu veriyi bastirabiliyor muyum diye bakiyor
    guard let name = uye.name, let email = uye.email, let password = uye.password else {
        print("Veriler okunmadi")
        return
    }
    
    print(name)
    print(email)
    print(password)
}

let uye = Member(name: "Zeynep", email: "zeynep@gmail.com", password: nil)
uyeGetir(uye: uye)

// ----------------------------------------
// ERROR HANDLING
// --------------------------------------

// try, try?, try!
enum NameValidator: Error {
    case tooLong
    case tooShort
}

func nameValidation (name: String) throws -> String {
    if name.count > 9 {
        throw NameValidator.tooLong
    } else if name.count < 2 {
        throw NameValidator.tooShort
    } else {
        print(name)
        return name
    }
}
//try nameValidation(name: "Cem")

// try: hata varsa ben onu yakalarim, do try catch blogunda kullaniliyor. Zeynep Style

do {
    try nameValidation(name: "Zeynep Ozcan")
} catch NameValidator.tooLong {
    print("Name is too long")
    
} catch NameValidator.tooShort {
    print("Namr is too short")
}

// try? : hatasiz kul olmaz, do catch kullanmaya ihtiyacim yok. Songul style

if let isim = try? nameValidation(name: "Songul") {
    print("Name is valid \(isim)")
} else {
    print("name is non valid")
}

//try! Ben hatalari hic sevmem hata yakalarsam Bozulurm (crash) Oguzhan style
//Do or die yaklasimiyla hata yakalar

let result = try! nameValidation(name: "Oguzhan")

enum calculateError: Error {
    case nanError // 0 / 0
    case InfError //sayi / 0
    case baseError //bolunen 0 ise
    
}

func bolme(bolunen: Double, bolen: Double) throws -> Double {
    
    guard bolunen != 0 || bolen != 0 else {
        print("nan error")
        throw calculateError.nanError
    }
    
    guard bolunen != 0 else {
        print("base error")
        throw calculateError.baseError
    }
    
    guard bolen != 0 else {
        print("inf error")
        throw calculateError.InfError
    }
    
    return bolunen / bolen
}



/*extension Int {
    func isEven() {
      return self % 2 == 0
    }
}*/

//GENERICS -TIPTEN BAGIMSIZ SEKILDE KULLANIMA IZIN VEREN YAPILAR
//generik kullanarak 2 sayinin toplamini donen bir fonksiyon

func sumNumber<T: Numeric>(first: T, second: T) -> T {
    return first + second
}

func findIndex<T>(foundItem: T, in items: [T]) -> Int? {
    return 0
} // hatali bir kullanim var mi? -- eger arrayde bulamazsa indexi Int yazdigimiz icin crashed olur, o yuzden Int? yazariz
                      

// 2 parametreli ve farklı tipli bir generic örneği yapınız, euler 7
//ODEV HESAP MAKINESI REFACTOR.
// sayinin tek cift oldugunu bilen extention
