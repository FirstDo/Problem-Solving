//2078번: 무한이진트리

func findPath(l: Int, r: Int, x: Int, y: Int) {
    if x == 1 && y == 1 {
        print(l, r)
        return
    }
    
    if x > y {
        findPath(l: l+1, r: r, x: x-y, y: y)
    } else {
        findPath(l: l, r: r+1, x: x, y: y-x)
    }
}

let ab = readLine()!.split(separator: " ").map{Int(String($0))!}

if ab[0] == 1 {
    print(0, ab[1] - 1)
} else if ab[1] == 1 {
    print(ab[0] - 1, 0)
} else {
    findPath(l: 0, r: 0, x: ab[0], y: ab[1])
}
