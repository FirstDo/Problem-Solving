let firstLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let k = firstLine[0]
let n = firstLine[1]

var lan = [Int]()
for _ in 0..<k {
    lan.append(Int(readLine()!)!)
}

let limit = lan.max()!
var answer = 0
binarySearch(1,limit)
print(answer)

func binarySearch(_ s: Int, _ e: Int){
    var start = s, end = e
    while start<=end{
        var total = 0
        let mid = (start+end)/2
        for l in lan{
            total += l/mid
        }
        if total < n {
            end = mid - 1
        } else if total >= n {
            if answer < mid {
                answer = mid
            }
            start = mid + 1
        }
    }
}
