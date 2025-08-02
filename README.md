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

## Sample input vs sanitized contents saved inside DB.

| **Input**                                                                                   | **Sanitized Output**       |
| ------------------------------------------------------------------------------------------- | -------------------------- |
| `<script>alert('XSS Attack!');</script>`                                                    | *(removed)*                |
| `<img src="x" onerror="alert('XSS Attack!')" />`                                            | `<img src="x">`            |
| `<a href="javascript:alert('XSS Attack!')">Click me</a>`                                    | `<a>Click me</a>`          |
| `<svg onload=alert('XSS Attack!')>`                                                         | `<svg></svg>`              |
| `<div style="width:expression(alert('XSS Attack!'));">X</div>`                              | `<div>X</div>`             |
| `<a href="JaVaScRiPt:alert('XSS Attack!')">Click here</a>`                                  | `<a>Click here</a>`        |
| `<scr<script>ipt>alert('XSS Attack!')</scr<script>ipt>`                                     | *(removed)*                |
| `<a href="&#x6A;&#x61;&#x76;&#x61;&#x73;&#x63;&#x72;&#x69;&#x70;&#x74;:alert(1)">click</a>` | `<a>click</a>`             |
| `<img src="x" alt="test" onclick="alert(1)">`                                               | `<img src="x" alt="test">` |
