// 12915번 대회 개최

import Foundation

let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
var (E, EM, M, MH, H) = (t[0], t[1], t[2], t[3], t[4])

var cnt = 0

while true {
    // 쉬움
    if E > 0 {
        E -= 1
    } else if EM > 0 {
        EM -= 1
    } else {
        break
    }
    
    // 어려움
    if H > 0 {
        H -= 1
    } else if MH > 0 {
        MH -= 1
    } else {
        break
    }
    
    // 중간
    if M > 0 {
        M -= 1
    } else {
        if EM > MH, EM > 0 {
            EM -= 1
        } else if EM < MH, MH > 0 {
            MH -= 1
        } else if EM == MH, EM > 0 {
            EM -= 1
        } else {
            break
        }
    }
    
    cnt += 1
}

print(cnt)