# Demo for Docker CE

## Prerequisites

- A linux machine or VM with Docker CE installed. You can check whether Docker is installed by running

```bash
docker --version
```

- If docker can't be run due to permission issues, you can add your user to the docker group by running the following command and then either relogin or reboot.

```bash
sudo usermod -aG docker $USER
```

- You also need make to run Makefile commands. You can check whether make is installed by running

```bash
make --version
```

## Installation and Setup

### Create Parent Directory and Clone Repositories

- First make a parent directory, in here both the backend and frontend directories will be cloned.
- Clone the backend and frontend repositories into the parent directory.

```bash
git clone -b linux-class git@github.com:NichikouGN/ticket-box-backend.git

git clone -b linux-class git@github.com:NichikouGN/ticket-box-web.git
```

### Initialize the backend and frontend repositories

- Initialized the backend and frontend by cd into their respective directories and run the following commands:

```bash
npm install
```

### Get the compose files

- Download the docker-compose files and the .env files from the Zalo group chat and put it in the parent directory.
- At the parent directory, also create a .dockerignore file with the following content:

```
node_modules
dist
.git
```

- At this point, the parent directory should look like this:

```
parent-directory/
├── compose.single.yml
├── compose.multi.yml
├── .dockerignore
├── Makefile
├── ticket-box-backend/
└── ticket-box-web/
```

### Get the .env files

- The .env files come with multiple files like so

```
env/
├── back.env
├── front.env
├── api.env
├── user.env
├── order.env
├── payment.env
├── concert.env
├── notification.env
└── ticket.env
```

- In order to put these in the right place, following the steps below. Remember that after they are in the right place, you need to rename them to .env. The steps are as follows:

1. the back.env goes into the ticket-box-backend directory
2. the front.env goes into the ticket-box-web directory
3. the remaining .env files go into their respective service directories within the ticket-box-backend directory.

```
ticket-box-backend/
├── services/
    ├── api-gateway/ <-- api.env and so on
    ├── user-service/
    ├── order-service/
    ├── payment-service/
    ├── concert-service/
    ├── notification-service/
    └── ticket-service/
```

### Test the docker compose setup

- At the parent directory, run the following command to test docker compose setup:

```bash
docker compose -f compose.single.yml build ticket-box-frontend
docker compose -f compose.single.yml up ticket-box-frontend
```

- If the frontend is running, you should be able to access it at http://localhost:5173. You can stop the frontend by pressing `Ctrl + C` in the terminal.

### Test the Makefile commands

- At the parent directory, run the following command to test the Makefile commands:

```bash
make demo-1
```
