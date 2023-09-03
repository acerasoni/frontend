## Requirements

- [pnpm](https://pnpm.io/installation)

## Sync With Skeleton Repo

Branch off
Run update-frontend.sh
Resolve conflicts
PR into develop

# Expose Website Through Secure Tunnelling

## Pre-requisites
Make sure the Svelte front-end is running. From a terminal window in the root of the project,

`cd website`
`npm run dev`

This will expose the application on `http://localhost:5173`

Also make sure the Spring-Boot back-end is running at `http://localhost:8080`

## Activate Tunnelling
To temporarily expose the website to internet traffic, run the following commands

`./ngrok.exe http 5173`