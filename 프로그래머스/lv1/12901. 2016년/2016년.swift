import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let day = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let dayOfMonth = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    // 몇일차인지 구한다
    
    var diff = 0
    
    diff += (1..<a).reduce(0) { partialResult, month in
        partialResult + dayOfMonth[month]
    }
    
    diff += b - 1
    
    // 요일을 구한다
    
    let index = (diff % 7 + 5) % 7
    return day[index]
}
