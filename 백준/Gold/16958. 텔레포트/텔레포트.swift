// 16958번 텔레포트

typealias City = (s: Int, x: Int, y: Int)

// 입력받는 함수
func input() -> [Int] {
    readLine()!.split(separator: " ").map{Int(String($0))!}
}

// 맨헤튼거리 구하는 함수
func getDistance(city1: City, city2: City) -> Int {
    return abs(city1.x - city2.x) + abs(city1.y - city2.y)
}

// 도시를 입력받는 함수
func makeCityList() -> [City] {
    var cityList = [City]()

    for _ in 0..<N {
        let t = input()
        cityList.append((t[0], t[1], t[2]))
    }
    
    return cityList
}

// 가장 가까운 텔레포트 위치를 저장하는 함수
func makeTeleportDistance() -> [Int] {
    var arr = Array(repeating: 9876543210, count: N)
    
    for i in 0..<N {
        // 텔포 가능한 거리면 0으로 설정
        if cityList[i].s == 1 {
            arr[i] = 0
            continue
        }
        
        // 아니면 가장 가까운 텔레포트 도시를 찾기
        
        var minDist = 9876543210
        
        for j in 0..<N where cityList[j].s == 1 {
            let curDist = getDistance(city1: cityList[i], city2: cityList[j])
            minDist = min(minDist, curDist)
        }
        
        arr[i] = minDist
    }
    
    return arr
}

// 거리 계산
func calculateDistance() {
    let m = Int(readLine()!)!

    for _ in 0..<m {
        let t = input()
        let (a, b) = (t[0] - 1, t[1] - 1)
        // 걸어서
        let walkDist = getDistance(city1: cityList[a], city2: cityList[b])
        // 텔레포트로
        let teleportDist = teleportDistance[a] + teleportDistance[b] + T
        
        print(min(walkDist, teleportDist))
    }
}

// 실제 입력
let t = input()
let (N, T) = (t[0], t[1])

let cityList = makeCityList()
let teleportDistance = makeTeleportDistance()

calculateDistance()
