//20056번 마법사 상어와 파이어볼

struct Pos: Hashable {
    let r: Int
    let c: Int
}

let dr = [-1,-1,0,1,1,1,0,-1]
let dc = [0,1,1,1,0,-1,-1,-1]

struct FireBall {
    let pos: Pos
    let speed: Int
    let mass: Int
    let direction: Int
    
    func move(len: Int) -> Self {
        var nr = (dr[direction] * speed + pos.r) % len
        var nc = (dc[direction] * speed + pos.c) % len
        
        if nr < 0 { nr += len }
        if nc < 0 { nc += len }
        
        return FireBall(pos: Pos(r: nr, c: nc), speed: speed, mass: mass, direction: direction)
    }
}

//input

let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var fireList = [FireBall]()
var arr = Array(repeating: Array(repeating: [FireBall](), count: n), count: n)

for _ in 0..<m {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (r,c,m,s,d) = (t[0]-1, t[1]-1, t[2], t[3], t[4])

    let fireBall = FireBall(pos: Pos(r: r, c: c), speed: s, mass: m, direction: d)
    fireList.append(fireBall)
}

func move() {
    // 1. 모든 파이어볼이 자신의 방향 di로 속력 si칸 만큼 이동한다.
    fireList = fireList.map{$0.move(len: n)}
    arr = Array(repeating: Array(repeating: [FireBall](), count: n), count: n)
    
    fireList.forEach { fireball in
        arr[fireball.pos.r][fireball.pos.c].append(fireball)
    }
}

func merge() {
    // 2. 같은 칸에 있는 파이어볼은 모두 하나로 합쳐진다.
    let mergeList = arr.flatMap{$0}.filter{ $0.count >= 2}
    
    for fireballs in mergeList {
        
        var isEven = false
        var isOdd = false
        var mass = 0
        var speed = 0
        
        
        let count = fireballs.count
        
        for fireball in fireballs {
            if fireball.direction % 2 == 0 {
                isEven = true
            } else {
                isOdd = true
            }
            
            mass += fireball.mass
            speed += fireball.speed
        }
        
        mass /= 5
        speed /= count
        
        let pos = fireballs.first!.pos
        
        if mass == 0 {
            arr[pos.r][pos.c] = []
            continue
        }
        
        //값 다시 대입
        let dirs = isEven && isOdd ? [1,3,5,7] : [0,2,4,6]
        arr[pos.r][pos.c] = dirs.map{FireBall(pos: pos, speed: speed, mass: mass, direction: $0)}
    }
    
    // fireList 갱신
    fireList = arr.flatMap{$0}.flatMap{$0}
}

for _ in 0..<k {
    move()
    merge()
}

print(fireList.reduce(0, { partialResult, fireball in
    partialResult + fireball.mass
}))