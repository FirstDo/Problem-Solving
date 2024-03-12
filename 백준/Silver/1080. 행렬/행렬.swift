let inputs: [String] = readLine()!.split(separator: " ").map{String($0)}
let n: Int = Int(inputs[0])!
let m: Int = Int(inputs[1])!

var arr: [[Int]] = []
var brr: [[Int]] = []

func turn(_ ary: inout [[Int]], _ row: Int, _ col: Int) {
    for i in row..<row+3 {
        for j in col..<col+3 {
            ary[i][j]=1-ary[i][j]
        }
    }
}
for _ in 0..<n {
    let temp = readLine()!.map{Int(String($0))!}
    arr.append(temp)
}

for _ in 0..<n {
    let temp = readLine()!.map{Int(String($0))!}
    brr.append(temp)
}
var cnt: Int = 0
if m<3 || n<3 {
    if arr==brr {
        print(0)
    } else {
        print(-1)
    }
}
else{
    for i in 0...n-3 {
        for j in 0...m-3 {
            if arr[i][j] != brr[i][j] {
                cnt += 1
                turn(&arr,i,j)
            }
        }
    }
    let result = arr==brr ? cnt : -1
    print(result)
}
