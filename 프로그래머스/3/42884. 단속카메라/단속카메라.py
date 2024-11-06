def solution(routes):
    routes.sort(key=lambda x: x[1])
    cameras = [] # 카메라의 위치
    
    print(routes)
    
    for route in routes:
        isIncluded = False
        
        for position in cameras:
            if route[0] <= position <= route[1]:
                # 카메라가 이미 설치되어있을때
                isIncluded = True
                break
    
        # 카메라가 설치되어있지 않을때
        if not isIncluded:
            cameras.append(route[1])
    
    return len(cameras)