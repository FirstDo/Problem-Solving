let n = Int(readLine()!)!
var weight = readLine()!.split(separator: " ").map{Int(String($0))!}

weight.sort()
var target: Int = 0

for i in weight {
    if target + 1 < i {
        break
    }
    target += i
}

print(target + 1)
