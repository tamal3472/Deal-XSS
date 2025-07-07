# README

## To setup the project your local system needs you need to have

* Ruby version
```bash
 ruby '3.2.2'
```

* Rails version
```bash
 gem 'rails', '~> 8.0.2'
```

* Database
```bash
 any latest postgres version
```

** To run the project

- Clone the repository

  ```bash
    https://github.com/tamal3472/Deal-XSS.git
  ```

- Run command

  ```bash
    gem install bundler
    bundle install
    rails db:create
    rails db:migrate
    rails s
  ```
Server should now up and running at: http://localhost:3000
