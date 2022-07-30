func solution(_ n:Int) -> String {
    let ans = String(repeating: "수박", count: n/2)
    
    if n % 2 == 0 {
        return ans
    } else {
        return ans + "수"
    }
}
