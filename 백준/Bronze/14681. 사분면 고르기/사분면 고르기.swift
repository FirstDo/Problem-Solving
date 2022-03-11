let n1 = Int(readLine()!)!
let n2 = Int(readLine()!)!

if n1 > 0 && n2 > 0 {
    print(1)
} else if n1 < 0 && n2 > 0 {
    print(2)
} else if n1 < 0 && n2 < 0 {
    print(3)
} else {
    print(4)
}
