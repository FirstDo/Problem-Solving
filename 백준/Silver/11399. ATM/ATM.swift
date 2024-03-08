let n: Int = Int(readLine()!)!
let time: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

var ans: Int = 0
var sum: Int = 0
time.forEach{
    sum += $0
    ans += sum
}

print(ans)
