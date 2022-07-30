func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings
        .map { $0.map { String($0) } }
        .sorted { lhs, rhs in
            if lhs[n] == rhs[n] {
                return lhs.joined() < rhs.joined()
            } else {
                return lhs[n] < rhs[n]
            }
        }.map { $0.joined() }
}
