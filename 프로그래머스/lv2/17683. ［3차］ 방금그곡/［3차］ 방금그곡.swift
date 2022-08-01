import Foundation

let dict = ["C#": "c", "D#": "d", "F#": "f", "G#": "g", "A#": "a", "E#": "e"]

func removeSign(_ str: String) -> String {
    var input = ""
    
    for ch in str {
        if ch == "#" {
            let key = String([input.removeLast(), ch])
            input.append(dict[key]!)
        } else {
            input.append(ch)
        }
    }
    
    return input
}

func getMinute(_ s: String, _ e: String) -> Int {
    let s = s.components(separatedBy: ":").map {Int($0)!}
    let e = e.components(separatedBy: ":").map {Int($0)!}
    
    return (e[0] * 60 + e[1]) - (s[0] * 60 + s[1])
}

struct Music {
    let index: Int
    let title: String
    let minute: Int
}

var musicList = [Music]()

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let m = removeSign(m)
    
    for (index, musicinfo) in musicinfos.enumerated() {
        let t = musicinfo.components(separatedBy: ",")
        
        let minute = getMinute(t[0], t[1])
        let title = t[2]
        let music = removeSign(t[3])
        
        let div = minute / music.count
        let remain = minute % music.count
        let realMusic = String(repeating: music, count: div) + String(Array(music)[0..<remain])
        
        if realMusic.contains(m) {
            musicList.append(Music(index: index, title: title, minute: minute))
        }
    }
    
    if let value = musicList.sorted(by: {
        if $0.minute == $1.minute {
            return $0.index < $1.index
        } else {
            return $0.minute > $1.minute
        }
    }).first {
        return value.title
    } else {
        return "(None)"
    }
}