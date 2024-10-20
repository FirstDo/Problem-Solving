import Foundation

struct Song {
  let id: Int
  let genres: String
  let playCount: Int
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
  var genreDict = [String: [Song]]() // 장르: [노래]
  var genrePlayDict = [String: Int]() // 장르: 재생횟수
  var bestAlbum = [Int]()
  
  // 노래 재생순서대로 정렬완료
  let songs = zip(genres, plays).enumerated()
    .map {
      Song(id: $0.offset, genres: $0.element.0, playCount: $0.element.1)
    }
    .sorted { $0.playCount > $1.playCount }
  
  for song in songs {
    if genreDict[song.genres] == nil {
      genreDict[song.genres] = []
    }
    
    if genrePlayDict[song.genres] == nil {
      genrePlayDict[song.genres] = 0
    }
    
    genreDict[song.genres]!.append(song)
    genrePlayDict[song.genres]! += song.playCount
  }
  
  let sortedGenres = genrePlayDict.sorted(by: { $0.value > $1.value })
  
  // 많이 재생된 장르부터 최대 2개씩 베스트 앨범에 추가
  for genre in sortedGenres {
    let songList = genreDict[genre.key]!
    bestAlbum.append(songList[0].id)
    if songList.count >= 2 {
      bestAlbum.append(songList[1].id)
    }
  }

  return bestAlbum
}
