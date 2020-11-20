From project directory:
    `docker-compose up --build` to build and run server and postgres from the current state of the repo
    `docker-compose down` to kill the running containers and removes the images created by 

For development with a venv:
    If running server code in the VM, the postgres server can be ran on its own for dev purposes with:
    `docker-compose up db`
