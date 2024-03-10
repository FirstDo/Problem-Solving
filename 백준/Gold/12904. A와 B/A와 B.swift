//12904번 A와 B
let s = Array(readLine()!)
var t = Array(readLine()!)

while true {
    if s.count == t.count {
        if s == t {
            print(1)
            break
        } else {
            print(0)
            break
        }
    }
    
    if t.last! == "A" {
        t.removeLast()
    } else {
        t.removeLast()
        t = t.reversed()
    }
}