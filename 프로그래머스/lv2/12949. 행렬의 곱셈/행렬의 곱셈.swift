func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    let row = arr1.count
    let col = arr2[0].count
    
    var result = Array(repeating: Array(repeating: 0, count: col), count: row)
    
    for i in 0..<row {
        for j in 0..<col {
            for k in 0..<arr1[0].count {
                result[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    
    return result
}