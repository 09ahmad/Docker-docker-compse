## Manual Installation 
 - Install nodejs locally 
 - Clone the repo 
 - Install depenedencies (npm install)
 - Start the database locally 
    - docker run -d --name databasename -p 5432:5432 -e POSTGRES_PASSWORD=youpassword postgres
    - Get one from neon db

- Change the .env file and update you DB credential 
- bunx prisma migrate dev
- bunx prism generate
- bun run build
- bun start


## Docker installation 
 - Install Docker  
 - Create a network - docker network create user_project
 - Start postgres 
   - docker run -d --network user_project --name postgresDB -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword postgres

- Build docker image - `docker build --network=host -t user-project .`
- Start the image  `docker run -e DATABASE_URL=postgresql://postgres:mysecretpassword@postgres:5432/postgres  --network user_project -p 3000:3000 user-project `

## Docker compose installation steps 
 - Install docker, docker compose
 - Run `docker-compose up`