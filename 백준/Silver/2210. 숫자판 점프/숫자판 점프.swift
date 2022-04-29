//2210번: 숫자판 점프

var arr = [[Int]]()

for _ in 0..<5 {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(t)
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

var answer = Set<Int>()

func dfs(_ i: Int, _ j: Int, _ depth: Int, _ number: Int) {
    if depth == 5 {
        answer.insert(number)
        return
    }
    
    for index in 0..<4 {
        let nx = i + dx[index]
        let ny = j + dy[index]
        
        if (0..<5).contains(nx) && (0..<5).contains(ny) {
            dfs(nx, ny, depth+1, number * 10 + arr[nx][ny])
        }
    }
}

for i in 0..<5 {
    for j in 0..<5 {
        dfs(i,j,0,arr[i][j])
    }
}

print(answer.count)
