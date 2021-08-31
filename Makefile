init-project:
	go mod init bookstore_users-api

build:
	docker build -t bookstore-users-api . 

run: build
	docker run -d -p 8082:8082 --name users-api bookstore-users-api

go-run: 
	mysql_users_username="admin" mysql_users_password="password123" mysql_users_host="127.0.0.1:3306" mysql_users_schema="users_db" go run -race main.go 
prune:
	docker system prune -f

ping:
	curl localhost:8082/ping

create:
	curl -XPOST localhost:8082/users -d '{"first_name":"John", "last_name":"Doe", "email":"johndoe@test.com", "password":"JDPassword"}'

create2:
	curl -XPOST localhost:8082/users -d '{"first_name":"Jane", "last_name":"Doe", "email":"janedoe@test.com", "password":"JD2Password"}'

create3:
	curl -XPOST localhost:8082/users -d '{"first_name":"Peter", "last_name":"Dork", "email":"pdork@test.com", "password":"password123"}'


login:
	curl -XPOST localhost:8082/users/login -d '{"email": "johndoe@test.com", "password": "JDPassword" }'

search:
	curl localhost:8082/internal/users/search?status=active

user:
	curl localhost:8082/users/1 

user-public:
	curl -H "x-public: true" localhost:8082/users/1 

user-token:
	curl -H "x-public: true" localhost:8082/users/1?access_token=12313213