//모든 단어는 anta - tica   : a c i n t

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let (L,K) = (inputs[0], inputs[1])
var alphaList = readLine()!.split(separator: " ").map{String($0)}
alphaList.sort()
var visited: [Bool] = [Bool](repeating: false, count: K)
var temp = ""



func dfs(_ depth: Int, _ idx: Int, _ v: Int, _ c: Int) {
    if depth == L {
        if v>=1 && c>=2 {
            print(temp)
        }
        return   
    }

    for i in idx..<K {
        if visited[i] {continue}
        visited[i] = true
        temp += "\(alphaList[i])"
        if alphaList[i] == "a" || alphaList[i] == "e" || alphaList[i] == "o" || alphaList[i] == "u" || alphaList[i] == "i" {
            dfs(depth+1, i+1, v+1, c)
        } else {
            dfs(depth+1, i+1, v, c+1)
        }
        visited[i] = false
        temp.removeLast()
    }

}


dfs(0,0,0,0)

/*
조건: 
1. 최소 한개의 모음과 최소 두개의 자음
2. 오름차순정렬
*/