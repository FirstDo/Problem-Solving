//22942번 데이터 체커
import Foundation

struct Data {
    let pos: Int
    let type: Ptype
    let id: Int
    
    enum Ptype {
        case open
        case close
    }
}

let n = Int(readLine()!)!
var list = [Data]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x,r) = (input[0], input[1])
    list.append(Data(pos: x-r, type: .open, id: i))
    list.append(Data(pos: x+r, type: .close, id: i))
}

list.sort{$0.pos < $1.pos}

func solve() -> Bool{
    for i in 1..<n {
        if list[i-1].pos == list[i].pos { return false }
    }
    
    var stack = [Int]()
    for elem in list {
        if elem.type == .open {
            stack.append(elem.id)
        } else if elem.id != stack.last! {
            return false
        } else {
            stack.removeLast()
        }
    }
    return true
}

print(solve() ? "YES" : "NO")
