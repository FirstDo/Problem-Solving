let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let (length, width, height) = (line[0], line[1], line[2])
let n = Int(readLine()!)!
var cubes: [[Int]] = []
var count = 0
var volume = 0

for _ in 0..<n {
    let lines = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (i,j) = (lines[0], lines[1])
    cubes.append([1<<i,j])
}

cubes.sort{$0[0] > $1[0]}
//print(cubes)

func cubeDivide(_ l: Int, _ w: Int, _ h: Int) {
    if l == 0 || w == 0 || h == 0 {
        return
    }
    var cubeN = 0

    for i in 0..<cubes.count {
        let cubeLen = cubes[i][0]
        let cubeNum = cubes[i][1]
        //새로운 큐브를 추가할 수 있을때
        if cubeLen <= l && cubeLen <= w && cubeLen <= h && cubeNum > 0 {
            cubeN = cubeLen
            cubes[i][1] -= 1
            count += 1
            volume += cubeN * cubeN * cubeN
            break
        }
    }

    if cubeN != 0 {
        cubeDivide(l-cubeN,cubeN,cubeN)
        cubeDivide(l,w-cubeN,h)
        cubeDivide(l,cubeN,h-cubeN)
    } else {
        return
    }
}

cubeDivide(length,width,height)

if volume != length*width*height {
    print(-1)
} else {
    print(count)
}


