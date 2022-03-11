//16920번 확장게임
struct Queue<T> {
	private var leftBox = [T]()
	private var rightBox = [T]()

	init() {}

	init(_ array: [T]) {
		self.init()
		self.leftBox = array
	}
	
	var isEmpty: Bool {
		return leftBox.isEmpty && rightBox.isEmpty
	}

	var count: Int {
		return leftBox.count + rightBox.count
	}

	// var front: T? {
	// 	return rightBox.last ?? leftBox.first
	// }

	var debug: [T] {
		return rightBox + leftBox.reversed()
	}

	mutating func enqueue(_ element: T) {
		leftBox.append(element)
	}

	mutating func dequeue() -> T {
		if rightBox.isEmpty {
			rightBox = leftBox.reversed()
			leftBox.removeAll()
		}
		return rightBox.removeLast()
	}
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M,P) = (t[0],t[1],t[2])
let s = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}

var board = [[Int]]()

var players = Array(repeating: [(Int,Int)](), count: P+1)

for i in 0..<N {
	let line = readLine()!.map{ ch -> Int in
		if ch.isNumber {
			return Int(String(ch))!
		} else if ch == "." {
			return 0
		} else {
			return -1
		}
	}
	board.append(line)

	for (j,value) in line.enumerated() where value > 0{
		players[value].append((i,j))
	}
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

while players.filter({$0.isEmpty}).count != P+1 {
	for num in 1...P {
		var next = [(Int,Int)]()
		var queue = Queue<((Int,Int),Int)>(players[num].map{($0,0)})

		while !queue.isEmpty {
			let (cur,cnt) = queue.dequeue()

			for i in 0..<4 {
				let (nx,ny) = (cur.0 + dx[i], cur.1 + dy[i])
				if (0..<N).contains(nx) && (0..<M).contains(ny) && board[nx][ny] == 0{ 

					board[nx][ny] = num
					if cnt + 1 < s[num] {
						queue.enqueue(((nx,ny),cnt+1))
					} else {
						next.append((nx,ny))
					}
				}
			}
		}
		players[num] = next
	}
}

var ans = Array(repeating: 0, count: P+1)
board.flatMap{$0.filter{$0 > 0}}.forEach{ans[$0] += 1}
print(ans[1...].map{String($0)}.joined(separator: " "))