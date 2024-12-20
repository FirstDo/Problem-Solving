let n = Int(readLine()!)!
var result: [Int] = []

func isPrime(_ num: Int) -> Bool{
    if num == 1 {
        return false
    }
    for i in 2..<num {
        if i*i > num {
            return true
        }
        if num % i == 0 {
            return false
        }
    }
    return true
}



func dfs(_ numStr: String, _ depth: Int) {
    if depth >= n {
        result.append(Int(numStr)!)
        return
    }
    
    for i in 1...9 {
        let tempStr = numStr + "\(i)"
        if isPrime(Int(tempStr)!) {
            dfs(tempStr,depth+1)
        }
    }
}


dfs("",0)
for r in result {
    print(r)
}
