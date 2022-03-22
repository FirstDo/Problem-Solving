let n = Int(readLine()!)!
var durability = [Int]()
var weight = [Int]()

for _ in 0..<n {
    let sw = readLine()!.split(separator: " ").map{Int($0)!}
    durability.append(sw[0])
    weight.append(sw[1])
}

var ans = 0
dfs(0)
print(ans)

func dfs(_ idx: Int) {
    if idx >= n {
        ans = max(ans, durability.filter{$0 <= 0}.count)
        return
    }
    
    if durability[idx] <= 0 {
        dfs(idx+1)
        return
    }
    
    var eggExist = false
    for i in 0..<n where i != idx && durability[i] > 0 {
        durability[i] -= weight[idx]
        durability[idx] -= weight[i]
        
        eggExist = true
        dfs(idx+1)
        
        durability[i] += weight[idx]
        durability[idx] += weight[i]
    }
    
    if !eggExist { dfs(n) }
}
