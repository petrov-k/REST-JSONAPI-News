# REST-JSONAPI-News(Gotoinc application)
## Overview
This pull request introduces a comprehensive CRUD Rails application that integrates various technologies and libraries to enhance its functionality and testing capabilities. Below is a detailed description of the components and features included in this application.EADME

Ruby version `3.2.2`

Features
- OAuth2 Authentication
- GraphQL API
- REST API
- JSON API
- PostgreSQL db

Testing 
* RSpec
* Cucumber
* Capybara

## Getting Started
To set up and run the application locally, follow these steps:

1. Clone the repository:
```
git clone https://github.com/petrov-k/REST-JSONAPI-News.git
cd REST-JSONAPI-News
```
2. Install dependencies
```
bundle install
```
3. Setup database
```
rails db:create
rails db:migrate
rails db:seed
```
