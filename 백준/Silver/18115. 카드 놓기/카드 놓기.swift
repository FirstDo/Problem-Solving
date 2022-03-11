//18115번 카드 놓기
struct Deque<T> {
    var queue1 = [T]()
    var queue2 = [T]()
    
    mutating func pushFirst(_ element: T) {
        queue2.append(element)
    }
    mutating func pushLast(_ element: T) {
        queue1.append(element)
    }
    mutating func popFirst() -> T{
        if queue2.isEmpty {
            queue2 = queue1.reversed()
            queue1.removeAll()
        }
        return queue2.removeLast()
    }
    mutating func popLast() -> T {
        if queue1.isEmpty {
            queue1 = queue2.reversed()
            queue2.removeAll()
        }
        return queue1.removeLast()
    }
}


let n = Int(readLine()!)!
let cmds = readLine()!.split(separator: " ").map{Int(String($0))!}

//1 카드를 stack에 넣는다
//2 카드를 stack의 끝에서 두번째에 넣는다
//3 카드를 stack의 가장 앞에 넣는다.

var deque = Deque<Int>()

func debug() {
    print(deque.queue1)
    print(deque.queue2)
}

for (idx,cmd) in cmds.reversed().enumerated() {
    switch cmd {
    case 1:
        deque.pushLast(idx+1)
    case 2:
        let temp = deque.popLast()
        deque.pushLast(idx+1)
        deque.pushLast(temp)
    case 3:
        deque.pushFirst(idx+1)
    default:
        break
    }
}

let res = deque.queue1.reversed() + deque.queue2
res.forEach{print($0, terminator: " ")}