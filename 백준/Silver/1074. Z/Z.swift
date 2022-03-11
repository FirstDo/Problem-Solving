import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0]
var r = line[1]
var c = line[2]
var count = 0

//완전탐색은 답이없음..
func visitSeq(_ n: Int, _ row: Int, _ col: Int) {
    var n = n

    if n == 2 {
        count += r*n+c
        print(count)
    } else {
        n = n/2
        if r < n && c < n {
            r %= n
            c %= n
            count += 0
            visitSeq(n,r,c)
        } else if r < n && c >= n {
            r %= n
            c %= n
            count += n*n
            visitSeq(n,r,c)
        } else if r >= n && c < n {
            r %= n
            c %= n
            count += n*n*2
            visitSeq(n,r,c)
        } else if r >= n && c >= n {
            r %= n
            c %= n
            count += n*n*3
            visitSeq(n,r,c)
        }
        
    }
}

let N = Int(pow(2.0,Double(n)))
visitSeq(N,0,0)