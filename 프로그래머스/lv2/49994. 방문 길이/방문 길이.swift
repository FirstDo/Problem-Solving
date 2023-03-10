import Foundation

struct Line: Hashable {
    let p1: Pos
    let p2: Pos
    
    struct Pos: Hashable {
        let x: Int
        let y: Int
    }
}

func solution(_ dirs:String) -> Int {
    var visit = [Line]()
    
    var x = 0, y = 0
    
    for dir in dirs {
        var nx = x, ny = y
        
        switch dir {
        case "L":
            nx -= 1
        case "R":
            nx += 1
        case "U":
            ny -= 1
        case "D":
            ny += 1
        default:
            fatalError()
        }
        
        if (-5...5).contains(nx) && (-5...5).contains(ny) {
            visit.append(Line(p1: .init(x: x, y: y), p2: .init(x: nx, y: ny)))
            visit.append(Line(p1: .init(x: nx, y: ny), p2: .init(x: x, y: y)))
            x = nx
            y = ny
        }
    }
    
    return Set(visit).count/2
}