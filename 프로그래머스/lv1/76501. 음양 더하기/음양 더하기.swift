// 음양 더하기

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return zip(absolutes, signs).map { number, sign in
        sign ? number : -number
    }
    .reduce(0, +)
}
