import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    // 페인트 칠할 횟수
    var count = 0
    
    // 배열의 각 원소 -1 해준후 시간복잡도를 위해서 뒤집기
    var section = Array(section.map { $0 - 1 }.reversed())
    
    // 더이상 칠할곳이 없을때까지 반복
    while !section.isEmpty {
        // 왼쪽 시작점 지정
        var startPoint = section.last!
        
        // 시작점 + 롤러의 너비가 오른쪽을 넘어가지 않는지 검사
        if startPoint + m > n {
            // 넘어간다면 왼쪽으로 더 당겨주기
            startPoint -= (startPoint + m - n)
        }
        
        // endPoint 바로 직전까지 한번에 색칠하게 됨
        let endPoint = startPoint + m
        count += 1
        
        while !section.isEmpty && section.last! < endPoint {
            section.removeLast()
        }
    }
    
    return count
}