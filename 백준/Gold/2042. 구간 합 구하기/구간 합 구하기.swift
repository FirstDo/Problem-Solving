// 2042번 구간 합 구하기

import Foundation

// 세그먼트 트리
struct SegmentTree {
    private var sumTree: [Int]
    
    init(_ data: [Int]) {
        self.sumTree = Array(repeating: 0, count: data.count * 4)
        makeTree(0, data.count-1, 1)
    }
    
    // 누적합 트리를 만드는 함수
    @discardableResult
    mutating private func makeTree(_ start: Int, _ end: Int, _ node: Int) -> Int {
        
        if start == end {
            sumTree[node] = data[start]
            return sumTree[node]
        }
        
        let mid = (start + end) / 2
        sumTree[node] = makeTree(start, mid, node * 2) + makeTree(mid+1, end, node * 2 + 1)
        
        return sumTree[node]
    }
    
    // 범위내의 누적합을 구하는 함수
    func getSum(_ start: Int, _ end: Int, _ node: Int, _ left: Int, _ right: Int) -> Int {
        if left > end || right < start { return 0 }
        if (left <= start && end <= right) { return sumTree[node] }
            
        let mid = (start + end) / 2
        return getSum(start, mid, node * 2, left, right) + getSum(mid+1, end, node * 2 + 1, left, right)
    }
    
    // 원소를 바꾸고 업데이트 하는 함수
    mutating func update(_ start: Int, _ end: Int, _ node: Int, _ index: Int, _ diff: Int) {
        if (index < start || index > end) { return }
        
        sumTree[node] += diff
        
        // 리프노드라면
        if (start == end) { return }
        
        let mid = (start + end) / 2
        update(start, mid, node * 2, index, diff)
        update(mid + 1, end, node * 2 + 1, index, diff)
    }
}


let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, m, k) = (t[0], t[1], t[2])

var data = (0..<n).map { _ in Int(readLine()!)! }
var segmentTree = SegmentTree(data)

for _ in 0..<(m+k) {
    let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let (a, b, c) = (t[0], t[1], t[2])

    // b를 c로 변경
    if a == 1 {
        let diff = c - data[b-1]
        data[b-1] = c
        
        segmentTree.update(0, data.count - 1, 1, b-1, diff)
    }
    // b ~ c 구간합
    else {
        print(segmentTree.getSum(0, data.count - 1, 1, b-1, c-1))
    }
}
