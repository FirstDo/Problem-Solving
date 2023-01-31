import Foundation

var result = [0, 0]

func binaryTransform(x: String) {
    if x == "1" { return }
    
    let len = x.filter {
        if $0 == "0" {
            result[1] += 1
            return false
        } else {
            return true
        }
    }.count
    
    result[0] += 1
    
    binaryTransform(x: String(len, radix: 2))
}

func solution(_ s:String) -> [Int] {
    binaryTransform(x: s)
    return result
}