import Foundation

func solution() {
  for i in 0..<3 {
    if let number = Int(readLine()!) {
      let index = 3 - i + number
      
      if index % 3 == 0 && index % 5 == 0 {
        print("FizzBuzz")
      } else if index % 3 == 0 {
        print("Fizz")
      } else if index % 5 == 0 {
        print("Buzz")
      } else {
        print(index)
      }
      
      return
    }
  }
}

solution()
