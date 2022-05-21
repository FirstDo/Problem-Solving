// 8911번 거북이

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]

typealias FourPoint = (maxX: Int, maxY: Int, minX: Int, minY: Int)

// 거북이 구조체

struct Turtle {
    var x: Int
    var y: Int
    var dir: Int
    
    mutating func move(_ cmd: Character) {
        if cmd == "F" {
            x += dx[dir]
            y +=  dy[dir]
        } else {
            x -= dx[dir]
            y -= dy[dir]
        }
    }
    
    mutating func rotate(_ cmd: Character) {
        if cmd == "L" {
            dir = dir - 1
        } else {
            dir = (dir + 1)
        }
        
        if dir == -1 { dir = 3 }
        if dir == 4 { dir = 0 }
    }
}

// 거북이를 움직이는 매서드

func move(_ cmds: String) {
    var turtle = Turtle(x: 0, y: 0, dir: 0)
    
    var pos: FourPoint = (0,0,0,0)
    
    // 거북이 이동
    for cmd in cmds {
        switch cmd {
        case "F", "B":
            turtle.move(cmd)
        case "L", "R":
            turtle.rotate(cmd)
        default:
            break
        }
        
        // 최대 좌표 기록
        pos.maxX = max(turtle.x, pos.maxX)
        pos.maxY = max(turtle.y, pos.maxY)
        pos.minX = min(turtle.x, pos.minX)
        pos.minY = min(turtle.y, pos.minY)
    }
    
    // 직사각형 너비 계산
    print(abs(pos.maxX - pos.minX) * abs(pos.maxY - pos.minY))
}

// 입력

let T = Int(readLine()!)!

for _ in 0..<T {
    let cmds = readLine()!
    move(cmds)
}
