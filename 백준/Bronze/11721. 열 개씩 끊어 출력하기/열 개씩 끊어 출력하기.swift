let word: [Character] = Array(readLine()!)

var cnt = 0
for ch in word {
    print(ch, terminator: "")
    cnt += 1
    if cnt == 10 {
        cnt = 0
        print("")
    }
}
