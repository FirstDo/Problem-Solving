//17374번 비트베리

/*
 비트 A개를 주고, 코인 B개 받기
 코인 B개 주고, 비트 A개 받기
 베리 C개를 주고, 코인 D개 받기
 코인 D개를 주고, 베리 C개 받기
 비트1개, 코인 1개주고, 비트코인 1개 받기
 */

for _ in 0..<Int(readLine()!)! {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (p,q,a,b,c,d) = (t[0], t[1], t[2], t[3], t[4], t[5])
    
    //베리를 코인으로 바꾸기
    var coin = q / c * d
    //코인을 비트로 바꾸기
    let bit = p + (coin / b) * a
    coin %= b
    
    let x = (bit - coin) / (a + b)
    
    let d1 = min(coin + (b * x), bit - (a * x))
    let d2 = min(coin + (b * (x + 1)), bit - (a * (x + 1)))
    print(max(d1,d2))
}
