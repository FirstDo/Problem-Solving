let n = Int(readLine()!)!
let arr = readLine()!.split(separator : " ").map{Int(String($0))!}

var lDp=[Int](repeating: 1, count: n)
var rDp=[Int](repeating: 1, count: n)
var result = [Int]()

for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] && lDp[i] < lDp[j] + 1 {
            lDp[i] = lDp[j] + 1
        }
    }
}

for i in stride(from: n-1, to: -1, by: -1) {
    for j in stride(from: n-1, to: i, by: -1) {
        if arr[i] > arr[j] && rDp[i] < rDp[j] + 1 {
            rDp[i] = rDp[j] + 1
        }
    }
}



for i in 0..<n {
    result.append(lDp[i] + rDp[i] - 1)
}

print(result.max()!)