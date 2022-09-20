import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
  
  func calculate(name: String, profit: Int) {
    // 원단위로 절사, 1원 미만일 경우 분배하지 않는다
    if profit / 10 == 0 {
      dicts[name]! += profit
      return
    }
    
    // 추천인이 없다면, 자기가 90먹고 종료
    if referralDicts[name] == "-" {
      dicts[name]! += profit - profit / 10
      return
    }
    
    // 나머지는 자신이 가진다
    dicts[name]! += profit - profit / 10
    
    // 남은 이익은 추천인에게 분배한다
    calculate(name: referralDicts[name]!, profit: profit / 10)
  }

  var dicts = [String: Int]()
  enroll.forEach { dicts[$0] = 0 }
  
  var referralDicts = [String: String]()
  
  for (enrollPerson, referralPerson) in zip(enroll, referral) {
    referralDicts[enrollPerson] = referralPerson
  }
  
  for (person, profit) in zip(seller, amount.map { $0 * 100 } ) {
    calculate(name: person, profit: profit)
  }
  
  return enroll.map { dicts[$0]! }
}