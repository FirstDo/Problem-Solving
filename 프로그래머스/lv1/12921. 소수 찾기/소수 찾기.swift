func primes() -> [Bool] {
    let limit = 1000000
    
    var prime = [false, false] + Array(repeating: true, count: limit-1)
    
    for i in 2...limit where prime[i] {
        for j in stride(from: i+i, through: limit, by: i) {
            prime[j] = false
        }
    }
    
    return prime
}

func solution(_ n:Int) -> Int {
    let priems = primes()
    return (1...n).filter{priems[$0]}.count
}