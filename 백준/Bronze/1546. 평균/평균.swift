_ = readLine()
var nums: [Double] = readLine()!.split(separator: " ").map{Double($0)!}

let maxValue: Double = nums.max()!

nums = nums.map { $0/maxValue*100}

let res: Double = nums.reduce(0,+)
print(res/Double(nums.count))

