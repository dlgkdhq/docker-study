# oracle db 컨테이너로 생성

# DB(Database) -> 데이터 저장 사용 -> 영속성

# 이미지 다운로드
docker pull doctorkirk/oracle-19c

# 볼륨 생성
docker volume create oracle19c-oradata

# docker run doctorkirk/oracle-19c


# 도커 컨테이너 실행(생성)
docker run -d --name oracle19c \
    -p 1522:1521 \       #host포트:컨테이너포트 
    -v oracle19c-oradata:/opt/oracle/oradata \      #명시적인 볼륨 사용
    -e ORACLE_SID=orcl \
    -e ORACLE_PWD=1234 \
    -e ORACLE_CHARACTERSET=AL32UTF8 \       # UTF8 인코딩 사용
    doctorkirk/oracle-19c

docker ps

# local pc에 다른 oracle db가 설치되어 있지 않으면
# -p 1521:1521 사용 가능
# 생성 시 1522 포트 사용 이유 : 현재 pc에 설치된 OracleDB 서버가 1521 포트를 사용중

# 볼륨 Bind Mount 방식
# -v d:/study/docker-study/sample/oracledb/oradata
# -v //d/study/docker-study/sample/oracledb/oradata


# 오라클 DB 컨테이너 생성 후, 계정 생성 및 접근 권한 설정
# 오라클 컨테이너 서버 접속 (명령어로 내부 접근)
docker exec -it oracle19c bash

# 컨테이너 내부 bash에서 명령어
# db 접근
sqlplus / as sysdba
ALTER SYSTEM DISABLE RESTRICTED SESSION;    #컨테이너로 생성된 DB는 기본으로 세션 연결 제한

# 계정 생성 및 접근 권한 부여
CREATE USER scott IDENTIFIED BY tiger;
GRANT CONNECT, RESOURCE TO scott;

# DB 정상접속 여부 확인 (sqldeveloper 등 기타 SQL Tool)
사용자이름 : scott
비번 : tiger
호스트이름 : localhost
포트번호 : 1522
서비스이름 : orcl


# 테이블 생성, 쿼리 작동 확인

# 도커 오라클 컨테이너 중지
docker stop oracle19c

# 중지하면 접속 안됨

# 도커 오라클 컨테이너 다시 실행 -> 접속 확인
docker start oracle19c