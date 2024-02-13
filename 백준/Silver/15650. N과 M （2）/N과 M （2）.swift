//15650번 N과 M (2)

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])


var temp = [Int]()
var result = ""

var visit = Array(repeating: false, count: N+1)

func getCombination(_ idx: Int, _ depth: Int, _ cnt: Int) {
    if cnt == M {
        result += temp.map{String($0)}.joined(separator: " ")+"\n"
        return
    }
    
    if idx > N {
        return
    }
    
    for i in idx...N {
        if !visit[i] {
            visit[i] = true
            temp.append(i)
            getCombination(i+1, depth+1, cnt+1)
            visit[i] = false
            temp.removeLast()
        }
    }
}

getCombination(1, 0, 0)
print(result.dropLast())