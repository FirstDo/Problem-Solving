// 2428번 표절

import Foundation

func upperBound(_ target: Double) -> Int {
    var low = 0, high = n
    
    while low < high {
        let mid = (low + high) / 2
        
        if files[mid] <= target {
            low = mid + 1
        } else {
            high = mid
        }
    }
    
    return high
}

let n = Int(readLine()!)!
let files = readLine()!.components(separatedBy: " ").map{Double($0)!}.sorted(by: <)

var ans = 0

for i in 0..<n-1 {
    let target = files[i] / 0.9
    let findIndex = upperBound(target) - 1
    
    ans += findIndex - i
}

print(ans)
