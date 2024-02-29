//permutation n번 수행

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,s) = (inputs[0],inputs[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0

func combination(_ idx: Int, _ sum: Int) {
    if idx >= n {
        return
    }
    if sum + arr[idx] == s {
        cnt += 1
    }

    combination(idx+1,sum)
    combination(idx+1,sum+arr[idx])
}

combination(0,0)
print(cnt)