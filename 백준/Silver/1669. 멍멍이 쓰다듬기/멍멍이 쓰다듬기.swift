/*
 1669번 멍멍이 쓰다듬기

 1차시도: bfs 메모리초과 실패
 */

let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
let (x,y) = (xy[0], xy[1])

let diff = y-x

//현재키
var tall = 1
//키의 증가분
var dx = 3
//현재 날짜
var day = 1

while true {
    //키가 목표치를 넘어버렸다면?
    if tall >= diff {
        //이전 키를 구한다
        let prevTall = tall - (dx-2)
        //중간값을 구한다: (3일과 5일의 사이라면, 답이 4일인지, 5일인지 판별하기 위해)
        let mid = (tall+prevTall)/2

        if diff <= mid {
            print(day-1)
        } else {
            print(day)
        }
        break
    }
    //아직 키가 부족하면 더 늘리기
    day += 2
    tall += dx
    dx += 2
}