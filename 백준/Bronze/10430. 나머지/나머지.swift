let input: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }

let n1 = input[0]
let n2 = input[1]
let n3 = input[2]

print((n1+n2)%n3)
print(((n1%n3)+(n2%n3))%n3)
print((n1*n2)%n3)
print(((n1%n3)*(n2%n3))%n3)
