import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }
    
    var cache = [String: Int]()
    var time = 0
    
    for (index, city) in cities.enumerated() {
        let city = city.lowercased()
        // hit
        if cache[city] != nil {
            time += 1
            cache[city] = index
        }
        // miss
        else {
            time += 5
            
            if cache.count >= cacheSize {
                let deleteKey = cache.sorted { $0.value < $1.value }.first!.key
                cache[deleteKey] = nil
            }
            
            cache[city] = index
        }
    }
    
    return time
}