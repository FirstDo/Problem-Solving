//주사위 굴리기

struct Dice {
    var x: Int
    var y: Int
    var top: Int
    var left: Int
    var right: Int
    var up: Int
    var down: Int
    var bottom: Int

    init(_ x: Int, _ y: Int, _ top: Int, _ left: Int, _ right: Int, _ up: Int, _ down: Int, _ bottom: Int) {
        self.x = x
        self.y = y
        self.top = top
        self.left = left
        self.right = right
        self.up = up
        self.down = down
        self.bottom = bottom
    }

    mutating func move(_ dir: Int) {
        switch dir {
        case 1: // ->
            (top,left,right,up,down,bottom) = (left, bottom, top, up, down, right)
        case 2: // <-
            (top,left,right,up,down,bottom) = (right, top, bottom, up, down, left)
        case 3: // ㅗ
            (top,left,right,up,down,bottom) = (down, left, right, top, bottom, up)
        case 4: // ㅜ
            (top,left,right,up,down,bottom) = (up, left, right, bottom, top, down)
        default:
            break
        }
    }
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,x,y,k) = (t[0], t[1], t[2], t[3], t[4])

var graph = [[Int]]()

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var dice = Dice(x,y,0,0,0,0,0,0)

let dx = [0,0,0,-1,1]
let dy = [0,1,-1,0,0]

for cmd in readLine()!.split(separator: " ").map({Int(String($0))!}) {
    let (nx,ny) = (dice.x + dx[cmd], dice.y + dy[cmd])

    if (0..<n).contains(nx) && (0..<m).contains(ny) {
        dice.move(cmd)
        if graph[nx][ny] == 0 {
            graph[nx][ny] = dice.bottom
        } else {
            dice.bottom = graph[nx][ny]
            graph[nx][ny] = 0
        }
        dice.x = nx
        dice.y = ny
        print(dice.top)
    }
}