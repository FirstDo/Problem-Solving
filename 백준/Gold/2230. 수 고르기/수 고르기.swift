//2230번 수 고르기
let nm = readLine()!.split(separator: " ").map{Int($0)!}
let (n,m) = (nm[0], nm[1])

var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var (start, end) = (0,0)

var minimum = Int.max

while start <= end, end < n {
    let target = arr[end] - arr[start]
    
    // 차이가 m 이상일때
    if target >= m {
        minimum = min(target, minimum)
        start += 1
        
        if start > end {
            end += 1
        }
    }
    // 차이가 m 이하일때
    else {
        end += 1
    }
}

print(minimum)

