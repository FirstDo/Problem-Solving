let inputs = Array(readLine()!.split(separator: " "))
let E = Int(inputs[0])
let S = Int(inputs[1])
let M = Int(inputs[2])
//1<=E<=15, 1<=S<=28, 1<=M<=19

var e: Int = 1, s: Int = 1, m: Int = 1
var count: Int = 1
while true {
    if e==E && s==S && m==M {
        print(count)
        break
    }
    count += 1
    e += 1
    s += 1
    m += 1
    if e == 16 {
        e = 1
    }
    if s == 29 {
        s = 1
    }
    if m == 20 {
        m = 1
    }
}

