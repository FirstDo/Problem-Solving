// 3107번 IPv6

import Foundation

func makeFullAddress(_ address: String) -> String{
    if address.isEmpty { return "" }
    
    let address = address.components(separatedBy: ":")
    let answer = address.map { subAddress -> String in
        let len = subAddress.count
        return String(repeating: "0", count: 4-len) + subAddress
    }
    
    return answer.joined(separator: ":")
}

let address = readLine()!

// :: 축약 있을때
if (address as NSString).contains("::") {
    let twoPart = (address as NSString)
                .components(separatedBy: "::")
    
    let front = makeFullAddress(twoPart[0])
    let end = makeFullAddress(twoPart[1])

    let lack = 8 - (front.count + 1)/5 - (end.count + 1)/5
    let lackAddress = Array(repeating: "0000", count: lack).joined(separator: ":")
    
    let totalAddress = [front, lackAddress, end]
                    .filter {!$0.isEmpty}
                    .joined(separator: ":")
    
    print(totalAddress)
}

// :: 축약 없을때
else {
    print(makeFullAddress(address))
}
