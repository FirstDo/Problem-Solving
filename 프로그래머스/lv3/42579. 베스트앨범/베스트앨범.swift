import Foundation

struct Song {
    let id: Int
    let playCount: Int
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // 장르 : [곡] 을 저장할 딕셔너리
    var dicts = [String: [Song]]()
    
    // 입력을 탐색하면서, dicts 딕셔너리를 만들어준다
    for (index, (genre, play)) in zip(genres, plays).enumerated() {
        if dicts[genre] == nil { dicts[genre] = [] }
        dicts[genre]!.append(Song(id: index, playCount: play))
    }
    
    // 각 장르 내에서 많이 재생한 순으로 곡을 정렬
    for (key, value) in dicts {
        dicts[key] = value.sorted {
            if $0.playCount == $1.playCount { // 재생횟수가 같다면 고유번호 순으로 정렬
                return $0.id < $1.id
            } else {
                return $0.playCount > $1.playCount // 재생횟수가 많은 순으로 정렬
            }
        }
    }
    
    var result = [Int]()
    
    // 조건에 따라 베스트 앨범 만들기
    for songs in dicts.values.sorted(by: sortByTotalPlayCount) {
        if songs.count >= 2 {
            result.append(contentsOf: songs[0..<2].map { $0.id})
        } else {
            result.append(contentsOf: songs.map { $0.id })
        }
    }
    
    return result
}

private func sortByTotalPlayCount(_ lhs: [Song], _ rhs: [Song]) -> Bool {
    return lhs.reduce(0) { $0 + $1.playCount } >= rhs.reduce(0) { $0 + $1.playCount }
}
