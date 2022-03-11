//18870번 좌표 압축

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.enumerated().sorted{$0.element < $1.element}
var ans = Array(repeating: 0, count: n)

var rank = 0
var previous = arr.first!.element

ans[arr.first!.offset] = rank

for (idx, value) in arr[1...] {
    if previous == value {
        ans[idx] = rank
    } else {
        rank += 1
        ans[idx] = rank
    }
    previous = value
}

print(ans.map{String($0)}.joined(separator: " "))