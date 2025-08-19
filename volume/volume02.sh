# 2) 명시적인 볼륨 사용 (Volume)

# 도커 볼륨 조회
docker volume ls

# 도커 볼륨 생성
docker volume create pg-storage

docker run --name pgdb -d \
        -v pg-storage:/var/lib/postgresql/data \
        -e POSTGRES_PASSWORD=pgpw \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_DB=mypgdb \
        -p 5432:5432 \
        postgres

# postgresql에 접속하여 확인용 테이블 생성
# vs code extension 설치 PostGreSQL Client Tool

# 테이블 생성
CREATE table test_table(
    id DECIMAL,
    name VARCHAR(12)
);

# 테이블 존재 여부 조회
select *
from pg_tables
WHERE tablename = 'test_table';

# 테이블 생성 후 기존 컨테이너 삭제 -> 다시 새로운 컨테이너로 시작(만들어둔 볼륨으로 연결)
# 새로운 컨테이너 기준으로 DB에 접속 -> 생성해둔 테이블이 존재하는가?

# 삭제
docker rm -f pgdb
# 컨테이너 다시 실행
docker run --name pgdb -d \
        -v pg-storage:/var/lib/postgresql/data \
        -e POSTGRES_PASSWORD=pgpw \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_DB=mypgdb \
        -p 5432:5432 \
        postgres

# 볼륨 삭제
docker volume rm pg-storage
# 볼륨 조회
docker volume ls
# 도커 볼륨 생성
docker volume create pg-storage





# mysql
docker volume create mysql-storage

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
        -v mysql-storage:/var/lib/mysql \
        -p 3306:3306 --name mysql mysql