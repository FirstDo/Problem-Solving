let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let oper = readLine()!.split(separator: " ").map{Int(String($0))!}  //+,-,x,/

var maxN = -1000000000
var minN = 1000000000

func dfs(_ idx: Int, _ plus: Int, _ sub: Int, _ mul: Int, _ div: Int, _ tot: Int){
    if idx == n {
        maxN = max(maxN,tot)
        minN = min(minN,tot)
        return
    }

    if plus < oper[0]{
        dfs(idx+1, plus+1, sub,mul,div,tot+arr[idx])
    }
    if sub < oper[1]{
        dfs(idx+1, plus, sub+1,mul,div,tot-arr[idx])
    }
    if mul < oper[2]{
        dfs(idx+1, plus, sub,mul+1,div,tot*arr[idx])
    }
    if div < oper[3]{
        dfs(idx+1, plus, sub,mul,div+1,tot/arr[idx])
    }
}

dfs(1,0,0,0,0,arr[0])
print(maxN)
print(minN)