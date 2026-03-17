#!/bin/bash
# 1. 업데이트 및 필수 패키지 설치 (Java, Git 등)
sudo yum update -y
sudo yum install -y java-17-amazon-corretto git

# 2. 애플리케이션 다운로드 (오픈소스 PetClinic)
cd /home/ec2-user
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic

# 3. 데이터베이스 연결 설정
export MYSQL_URL=jdbc:mysql://petclinic-db-ha.c1g6w4s6wqqb.ap-northeast-2.rds.amazonaws.com:3306/petclinic

# 4. 애플리케이션 빌드 및 실행
./mvnw package -DskipTests
nohup java -jar target/*.jar > /home/ec2-user/app.log 2>&1 &
