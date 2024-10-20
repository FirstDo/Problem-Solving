def solution(phone_book):
    phone_book.sort()
    length = len(phone_book)
    
    for i in range(length-1):
        if isPrefix(phone_book[i+1], phone_book[i]):
            return False

    return True

def isPrefix(target: str, prefix: str):
    if len(target) < len(prefix):
        return False
    
    for i in range(len(prefix)):
        if target[i] != prefix[i]:
            return False
        
    return True