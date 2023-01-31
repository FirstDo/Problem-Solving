import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }
    
    let cities = cities.map { $0.lowercased() }
    
    var cache = [String: Int]()
    var clock = 0
    var totalTime = 0
    
    for city in cities {
        if cache[city] == nil && cache.count >= cacheSize {
            let deleteKey = cache.sorted { $0.value < $1.value }.first!.key
            cache[deleteKey] = nil
        }

        totalTime += cache[city] == nil ? 5 : 1
        cache[city] = clock
        clock += 1
    }
    
    return totalTime
}
