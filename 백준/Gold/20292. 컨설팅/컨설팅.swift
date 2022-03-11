import Foundation
//20292번 컨설팅
/*
//	case 1: write a to b, read b
case 2: write a to b, write b to c
case 3: write a to c, write b to c
//	case 4: write a to b, write a to b
//	case 5: write a to b, write b to a
*/

var ans = ""
var from = [String:Bool]()
var to = [String:Bool]()
var read = [String:Bool]()
var cmd = [String: Bool]()

func clearDict() {
	from.removeAll()
	to.removeAll()
	read.removeAll()
	cmd.removeAll()
}

func insertWait() {
	clearDict()
	ans.append("WAIT\n")
}

while let input = readLine() {
	if input == "EXIT" { break}
	let t = input.split(separator: " ").map{String($0)}

	//WRITE
	if t[0] == "WRITE" {
		let r1 = t[1], str = t[2] ,r2 = t[3]
		if read[r2] == true || to[r1] == true || from[r2] == true || to[r2] == true || cmd[input] == true || cmd[t[0]+r2+str+r1] == true{
			insertWait()
		}
		from[r1] = true
		to[r2] = true
		cmd[input] = true
	} 
	//READ
	else {
		//case 1
		let r = t[1]

		if to[r] == true{
			insertWait()
		}
		read[r] = true
	}
	ans.append(input+"\n")
}
ans.append("EXIT")
print(ans)