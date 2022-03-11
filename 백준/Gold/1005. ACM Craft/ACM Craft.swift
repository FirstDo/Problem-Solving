import Foundation
//1005번 ACM Craft

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let fIO = FileIO()

for _ in 0..<fIO.readInt() {
	let (N,K) = (fIO.readInt(),fIO.readInt())

	var buildTime = [0]
	for _ in 0..<N {
		buildTime.append(fIO.readInt())
	}
	var indegree = Array(repeating: 0, count: N+1)
	var needTime = Array(repeating: 0, count: N+1)	//건물 i가 지어지기 위해 필요한 최소시간

	var graph = Array(repeating: [Int](), count: N+1)
	for _ in 0..<K {
		let (x,y) = (fIO.readInt(),fIO.readInt())
		graph[x].append(y)
		indegree[y] += 1
	}

	let target = fIO.readInt()

	var queue = [Int]()
	(1...N).forEach{
		if indegree[$0] == 0 {
			queue.append($0)
		}
	}
	var idx = 0

	while queue.count > idx {
		let cur = queue[idx]
		idx += 1

		if cur == target {break}

		for next in graph[cur] {
			indegree[next] -= 1
			needTime[next] = max(needTime[next], buildTime[cur] + needTime[cur])
			if indegree[next] == 0 {
				queue.append(next)
			}
		}
	}
	print(needTime[target] + buildTime[target])	
}

