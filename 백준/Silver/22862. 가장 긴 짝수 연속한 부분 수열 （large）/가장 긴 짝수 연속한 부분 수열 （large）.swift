//22862번 가장 긴 짝수 연속한 부분 수열(large)

//n,k 입력받기
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (t[0],t[1])
//수열 S 입력받기
let S = readLine()!.split(separator: " ").map{Int(String($0))!}

var (start, end) = (0,0)
var deleteCount = S[start] % 2 == 0 ? 0 : 1
var maxLen = S[start] % 2 == 0 ? 1 : 0

while end < N-1 {
    //endPointer를 한칸 오른쪽으로 옮긴다
    end += 1

    //옮긴 포인터가 홀수라면, deleteCount += 1
    if S[end] % 2 != 0 {
        deleteCount += 1
        
        //deleteCount가 K를 초과했으면, start를 오른쪽으로 하나씩 당긴다
        while deleteCount > K {
            if S[start] % 2 != 0 {
                deleteCount -= 1
            }
            start += 1
        }
    }
    
    maxLen = max(maxLen, end - start + 1 - deleteCount)
}

print(maxLen)
