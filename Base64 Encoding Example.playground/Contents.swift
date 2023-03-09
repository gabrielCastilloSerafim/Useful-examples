import UIKit

let myString = "Hello World"
let myStringBase64 = "SGVsbG8gV29ybGQ="

func toBase64(myString: String) -> String {
    
    let base64Encoded = myString.data(using: String.Encoding.utf8)!.base64EncodedString()
        
        return base64Encoded
}

func fromBase64(myStringBase64: String) -> String {
    
    let base64Decoded = Data(base64Encoded: myStringBase64)!
    let decodedString = String(data: base64Decoded, encoding: .utf8)!
    
    return decodedString
}

print(toBase64(myString: myString))
print(fromBase64(myStringBase64: myStringBase64))
