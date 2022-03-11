//16967번 배열 복원하기


let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (H,W,X,Y) = (t[0],t[1],t[2],t[3])

var arr = [[Int]]()

for _ in 0 ..< H+X {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
for i in 0..<H {
    for j in 0..<W {
        if i >= X && j >= Y {
            arr[i][j] -= arr[i-X][j-Y]
            print(arr[i][j],terminator: " ")
        } else {
            print(arr[i][j],terminator: " ")
        }
    }
    print()
}
