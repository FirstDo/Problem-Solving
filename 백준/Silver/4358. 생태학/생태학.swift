/*
 4358번 생태학
 */

import Foundation

func getPercentage(value: Double, total: Double) -> String {
    let percent = value/total * 100
    let roundPercent = round(percent * 10000) / 10000
    return String(format: "%.4f", roundPercent)
}

var dict: [String:Double] = [:]

while true {
    if let tree = readLine() {
        let value = dict[tree] ?? 0
        dict[tree] = value + 1
    } else {
        break
    }
}

let total = Double(dict.values.reduce(0, +))

for (tree, value) in dict.sorted(by: {$0.key < $1.key}) {
    print(tree + " " + getPercentage(value: value, total: total))
}

