// 2527번 직사각형

import Foundation

struct Rect {
    let x: Int
    let y: Int
    let p: Int
    let q: Int
}

for _ in 0..<4 {
    let t = readLine()!.components(separatedBy: " ").map{Int($0)!}

    let r1 = Rect(x: t[0], y: t[1], p: t[2], q: t[3])
    let r2 = Rect(x: t[4], y: t[5], p: t[6], q: t[7])

    if r1.q < r2.y || r2.q < r1.y || r1.x > r2.p || r1.p < r2.x {
        print("d")
    } else if r1.p == r2.x {
        print( r1.q == r2.y || r1.y == r2.q ? "c" : "b")
    } else if r1.x == r2.p {
        print( r1.y == r2.q || r1.q == r2.y ? "c" : "b")
    } else if r1.q == r2.y {
        print( r1.p == r2.x || r2.p == r1.x ? "c" : "b")
    } else if r2.q == r1.y {
        print( r1.p == r2.x || r2.p == r1.x ? "c" : "b")
    } else {
        print("a")
    }
}
