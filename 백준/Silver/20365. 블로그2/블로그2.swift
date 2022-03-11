//20365번 블로그2

let n = Int(readLine()!)!
let colors = Array(readLine()!)

var prevColor = colors.first!

var blueCount = 0
var redCount = 0

if prevColor == "B" {
    blueCount = 1
} else {
    redCount = 1
}


for i in 1..<n {
    if colors[i] != prevColor {
        if colors[i] == "B" {
            blueCount += 1
        } else {
            redCount += 1
        }
        prevColor = colors[i]
    }
}
print(min(blueCount,redCount) + 1)