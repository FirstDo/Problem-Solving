// 2118번 두 개의 탑

let n = Int(readLine()!)!
var tops = [Int]()

(0..<n).forEach { _ in tops.append(Int(readLine()!)!)}

var maxDistance = Int.min

var left = tops[0]
var right = tops.reduce(0, +) - tops[0]

maxDistance = max(min(left, right), maxDistance)

var low = 0
var high = 1

while low <= high {
    if left > right {
        right += tops[low]
        left -= tops[low]
        low += 1
    } else {
        if high + 1 < n {
            left += tops[high]
            right -= tops[high]
            high += 1
        } else {
            break
        }
    }
    
    maxDistance = max(min(left, right), maxDistance)
}

print(maxDistance)
