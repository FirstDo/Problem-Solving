/*
 1052번 물병
 
 목표: 물이 들어 있는 물병의 수를 K개 이하로 만들기
 */

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
var (n,k) = (nk[0], nk[1])

print(mergeWater())

func mergeWater() -> Int{
    if n <= k {
        return 0
    }
    //상점 구매횟수
    var answerCount = 0
    
    while true {
        //물병의 개수
        var cnt = 0
        
        var temp = n
        
        while temp > 0 {
            //딱 떨어진다면 합치기
            if temp % 2 == 0 {
                temp /= 2
            }
            //아니면, 상점에서 물병 구매하고 합치기
            else {
                temp /= 2
                cnt += 1
            }
        }
        //옮길수 있는 개수라면 옮기기
        if k >= cnt {
            break
        }
        
        n += 1
        answerCount += 1
    }
    return answerCount
}
