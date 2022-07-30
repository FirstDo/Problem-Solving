//문자열 내림차순으로 배치하기
func solution(_ s:String) -> String {
    return Array(s).sorted{ $0 > $1 }.map {String($0)}.joined()
}
