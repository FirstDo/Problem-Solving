// 2473번 세 용액

import Foundation

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let arr = readLine()!.components(separatedBy: " ").map{Int($0)!}.sorted(by: <)
    
    let answer = (0...n-3).map { index in
        arr[index + 2] - arr[index]
    }.max()!
    
    print(answer)
}
