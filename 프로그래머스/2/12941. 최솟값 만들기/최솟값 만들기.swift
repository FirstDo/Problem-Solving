func solution(_ A:[Int], _ B:[Int]) -> Int {
  let a = A.sorted()
  let b = B.sorted(by: >)
  
  return zip(a, b).reduce(0) { sum, params in
    sum + params.0 * params.1
  }
}