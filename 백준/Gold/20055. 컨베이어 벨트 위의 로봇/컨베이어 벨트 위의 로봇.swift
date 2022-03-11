//컨베이어 벨트 위의 로봇

struct Belt {
    var upBelt: [(Int, Bool)]
    var downBelt: [(Int,Bool)]
    let len: Int

    var count: Int {
        return upBelt.filter{$0.0 == 0}.count + downBelt.filter{$0.0 == 0}.count
    }

    mutating func moveBelt() {
        //N번째 벨트 이등
        var nData = upBelt.last!
        nData.1 = false

        //0 - N-1 up 벨트 이동
        for i in stride(from: len - 2, through: 0, by: -1) {
            upBelt[i+1] = upBelt[i]
        }

        //2N 벨트 이동
        upBelt[0] = downBelt[0]

        // N+1 ~ 2N - 1 벨트이동
        for i in 1..<len {
            downBelt[i-1] = downBelt[i]
        }
        
        // N -> N+1 이동
        downBelt[len-1] = nData
    }

    mutating func moveRobot() {
        //N번째칸 로봇제거
        upBelt[len-1].1 = false

        //로봇의 이동
        for i in stride(from: len - 2, through: 0, by: -1) {
            //로봇이 없다면 컨티뉴
            if upBelt[i].1 == false {continue}

            //옮길수 있으면 로봇 옮기기
            if upBelt[i+1].0 > 0 && upBelt[i+1].1 == false {
                upBelt[i+1].1 = true
                upBelt[i+1].0 -= 1
                upBelt[i].1 = false
            }
        }

        if upBelt[0].0 > 0 {
            upBelt[0].1 = true
            upBelt[0].0 -= 1
        }
    }

}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (t[0],t[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

let len = arr.count

var up = [(Int,Bool)]()
var down = [(Int,Bool)]()

for i in 0 ..< len / 2 {
    up.append((arr[i], false))
}

for i in stride(from: len - 1, through: len/2, by: -1) {
    down.append((arr[i], false))
}

var belt = Belt(upBelt: up, downBelt: down, len: len/2)

var cnt = 1

while true {
    belt.moveBelt()
    belt.moveRobot()
    if belt.count >= k {
        break
    }
    cnt += 1
}


print(cnt)