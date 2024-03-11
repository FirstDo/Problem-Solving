let input: [String] = readLine()!.split(separator: "-").map {String($0)}

var ans: Int = input[0].split(separator: "+").map{Int(String($0))!}.reduce(0,+)
input[1...].forEach{
    let num: Int = $0.split(separator: "+").map{Int(String($0))!}.reduce(0,+)
    ans -= num
}

print(ans)
