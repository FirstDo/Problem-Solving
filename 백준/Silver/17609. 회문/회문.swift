//17609번 회문
enum Palindrome: Int {
    case palin = 0
    case pseudo = 1
    case etc = 2
}

var result: Palindrome = .etc

func isPalin(_ str: [Character], _ left: Int, _ right: Int, _ cnt: Int) {
    if left < right {
        if str[left] == str[right] {
            isPalin(str, left+1, right-1, cnt)
        } else {
            if cnt == 1 {
                return
            }
            
            if str[left+1] == str[right] {
                isPalin(str, left+1, right, cnt+1)
            }
            
            if str[left] == str[right - 1] {
                isPalin(str, left, right-1, cnt+1)
            }
            
            if str[left+1] != str[right] , str[left] != str[right - 1] {
                return
            }
        }
    } else {
        //여기까지 왔을때..
        switch cnt {
        case 0:
            result = .palin
        case 1:
            result = .pseudo
        default:
            result = .etc
        }
        return
    }
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let str = Array(readLine()!)
    isPalin(str, 0, str.count-1, 0)
    
    print(result.rawValue)
    result = .etc
}
