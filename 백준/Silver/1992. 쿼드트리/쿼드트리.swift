let n = Int(readLine()!)!
var image: [[Int]] = []

func divideImg(_ n: Int, _ row: Int, _ col: Int) {
    if n == 1 || imageValue(n,row,col) == 1 {
        print(image[row][col], terminator: "")
        return
    } else {
        let n = n/2

        print("(",terminator: "")
        //print("왼쪽위 부분", n, row, col)
        divideImg(n,row,col)
        //print(")",terminator: "")
        //print("(",terminator: "")
        //print("오른쪽위 부분", n, row, col+n)
        divideImg(n,row,col+n)
        //print(")",terminator: "")
        //print("(",terminator: "")
        //print("왼쪽 아래 부분", n, row+n, col)
        divideImg(n,row+n,col) 
        //print(")",terminator: "")
        //print("(",terminator: "")
        //print("오른쪽 아래 부분", n, row+n, col+n)
        divideImg(n,row+n,col+n)      
        print(")",terminator: "")
    }

}

func imageValue(_ n: Int, _ row: Int, _ col: Int) -> Int{ 
    let value = image[row][col]
    for i in row..<row+n {
        for j in col..<col+n {
            if image[i][j] != value {   
                return -1
            }
        }
    }
    return 1
}

for _ in 0..<n {
    image.append(readLine()!.map{Int(String($0))!})
}


divideImg(n,0,0)

