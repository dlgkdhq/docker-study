# 웹서버 실행 시키기
# 웹서버 (Ngnix)

docker run --rm -d -p 8080:80 nginx
# http://localhost:8080/ 접속해서 상태 확인


# 지금 실행중인 도커 컨테이너 정보 조회
docker ps
docker ps -a    #실행중이 아닌 컨테이너도 포함해서 조회

# 실행중인 도커 종료+삭제
docker rm -f [컨테이너 아이디 or 컨테이너 이름]
# -f 강제로 삭제하겠다(force)

docker rm -f elegant_shockley 

docker rm -f c77c # 아이디는 앞에 어느정도 4~5자 쓰면 됨
