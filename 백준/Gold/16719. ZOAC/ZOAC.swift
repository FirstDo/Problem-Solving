//16719번 ZOAC

let str = readLine()!.map{String($0)}
let len = str.count

var check = Array(repeating: false, count: len)
var answer = ""

func recur(l: Int, r: Int) {
    if l > r { return }
    var index = l
    
    for i in l...r {
        if str[index] > str[i] {
            index = i
        }
    }
    check[index] = true
    
    for i in 0..<len where check[i] {
        answer += str[i]
    }
    
    answer += "\n"
    
    recur(l: index + 1, r: r)
    recur(l: l, r: index - 1)
}

recur(l: 0, r: len-1)
print(answer)
