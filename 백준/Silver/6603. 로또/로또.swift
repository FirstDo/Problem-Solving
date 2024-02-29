import Foundation
//6603번 로또

var result = ""
var temp = [Int]()
var visit = [Bool]()

func combi(_ idx: Int, _ depth: Int, _ arr: [Int], _ k: Int) {
	if depth == 6 {
		result.append(temp.map{String($0)}.joined(separator: " "))
		result += "\n"
		return	
	}

	for i in idx..<k {
		if !visit[i] {
			temp.append(arr[i])
			visit[i] = true
			combi(i+1,depth+1, arr, k)
			temp.removeLast()
			visit[i] = false
		}
	}

}

while true {
	let input = readLine()!.split(separator: " ").map{Int(String($0))!}
	let k = input.first!

	if k == 0 { break }

	let arr = Array(input[1...])
	visit = [Bool](repeating: false, count: k)
	//temp = []
	combi(0,0,arr,k)
	result += "\n"
}

print(result.dropLast(2))