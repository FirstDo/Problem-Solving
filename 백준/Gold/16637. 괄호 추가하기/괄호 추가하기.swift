//16637번 괄호추가하기
let n = Int(readLine()!)!

var ops = [Character]()
var numbers = [Int]()

for ch in readLine()! {
	if ch.isNumber {
		numbers.append(Int(String(ch))!)
	} else {
		ops.append(ch)
	}
}
func calc(_ op: Character, _ a: Int, _ b: Int) -> Int {
	var res = 0
	switch op {
	case "+":
		res = a + b
	case "-":
		res = a - b
	case "*":
		res = a * b
	default:
		break
	}
	return res
}
var ans = Int.min

func dfs(_ idx: Int, _ sum: Int)  {
	//종료조건
	if idx >= ops.count {
		ans = max(ans,sum)
		return
	}
	//괄호연산 하지않음
	let tempSum = calc(ops[idx],sum,numbers[idx+1])
	dfs(idx+1, tempSum)
	//다음연산에 괄호연산
	if idx + 1 < ops.count {
		let nextSum = calc(ops[idx+1], numbers[idx+1], numbers[idx+2])
		let tempSum = calc(ops[idx], sum, nextSum)
		dfs(idx+2, tempSum)
	}
}

dfs(0,numbers[0])
print(ans)