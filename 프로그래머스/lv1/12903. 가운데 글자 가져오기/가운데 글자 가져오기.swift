import Foundation

func solution(_ s:String) -> String {
    let len = s.count
    let s = Array(s)
    
    if len % 2 == 0 {
        return String(s[len/2 - 1]) + String(s[len/2])
    } else {
        return String(s[len/2])
    }
}
