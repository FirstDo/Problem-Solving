import Foundation

func solution(_ numbers:[Int]) -> String {
  let result = numbers
    .sorted {
      Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    .reduce("") { $0 + "\($1)" }
  
  return result.first == "0" ? "0" : result
}