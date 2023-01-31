func solution(_ s:String) -> String {
    return s.components(separatedBy: " ")
        .map { word in
            if word.isEmpty { return "" }
            
            let lowerWord = word.lowercased()
            
            if lowerWord.first!.isLowercase {
                return lowerWord.first!.uppercased() + lowerWord.dropFirst()
            } else {
                return lowerWord
            }
        }
        .joined(separator: " ")
}