import Foundation

func solution(_ s:String) -> Bool
{
    let s = s.lowercased()
    let p = s.filter { $0 == "p" }.count
    let y = s.filter { $0 == "y" }.count
    
    return p == y
}
