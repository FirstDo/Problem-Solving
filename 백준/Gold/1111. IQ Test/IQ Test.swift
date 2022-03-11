//1111번 IQ Test

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

func solve() -> String{
    if n == 1 {
        return "A"
    }
    
    if n == 2 {
        return arr[0] == arr[1] ? String(arr[0]) : "A"
    }
    
    let tmp1 = arr[1] - arr[0]
    let tmp2 = arr[2] - arr[1]
    
    let a = tmp1 == 0 ? 0 : tmp2/tmp1
    let b = arr[1] - a * arr[0]
    
    for i in 2..<n {
        if arr[i] != arr[i-1] * a + b {
            return "B"
        }
    }
    return "\(arr[n-1] * a + b)"
}

print(solve())


