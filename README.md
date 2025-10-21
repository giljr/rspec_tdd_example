# Rails 8 RSpec TDD Example

Welcome! This is a **hands-on Ruby on Rails 8 project** demonstrating how to use **RSpec for TDD** (Test-Driven Development) to test models, controllers, and helpers.  

Inspired by [Denin's 20in20 Week 14 video](https://youtu.be/AAqPc0j_2bg?si=wB8LngYTZW-nL11J), this project shows you how to write **real, working tests** in Rails 8.

---

## Features

- **User model tests**: Basic validations and Devise integration.
- **Posts CRUD tests**: Full request specs for `index`, `show`, `new`, `edit`, `create`, `update`, `destroy`.
- **Helper tests**: Unit tests for helper methods like `assign_post_creator`.
- **TDD workflow**: Write tests first, implement features, watch tests pass.
- **Devise integration**: Authentication handled in tests using `Devise::Test::IntegrationHelpers`.

---

## Getting Started

### Prerequisites

- Ruby >= 3.2  
- Rails 8  
- PostgreSQL or SQLite (default)  
- Bundler  

### Setup

#### 1. Clone the repository:

```bash
git@github.com:giljr/rspec_tdd_example.git
cd rspec_tdd_example
```

#### 2. Install dependencies:
```bash
bundle install
```

#### 3. Setup the database:
```bash
rails db:create db:migrate
````

#### 4. Run the tests:

```bash
bundle exec rspec
````
Or by directories Or scenarios:

```bash
bin/rspec
bin/rspec spec/models/post_spec.rb
bin/rspec spec/views/posts/edit.html.erb_spec.rb
bundle exec rspec spec/views/posts/edit.html.erb_spec.rb --format documentation
bundle exec rspec spec/views/posts/index.html.erb_spec.rb
bundle exec rspec spec/views/posts/new.html.erb_spec.rb
bundle exec rspec spec/views/posts/show.html.erb_spec.rb
bundle exec rspec spec/routing/posts_routing_spec.rb
bundle exec rspec spec/requests/posts_spec.rb
bundle exec rspec spec/requests/posts_spec.rb:43
bundle exec rspec spec/requests/posts_spec.rb:45
bundle exec rspec spec/requests/posts_spec.rb:53
bundle exec rspec spec/requests/posts_spec.rb:61
bundle exec rspec spec/requests/posts_spec.rb:76
bundle exec rspec spec/helpers/posts_helper_spec.rb

```
You should see all tests passing, showing TDD in action.


### How to Explore

`spec/models` → Tests for User and Post validations.

`spec/requests` → End-to-end CRUD tests for PostsController.

`spec/helpers` → Unit tests for helper methods like assign_post_creator.

### Why Check This Out

- Learn RSpec basics and advanced testing in Rails 8.

- See TDD workflow in action.

- Get a working template for your own Rails projects.

### Check out the original tutorial for inspiration:
Denin - [RSpec TDD in Rails 6](https://youtu.be/AAqPc0j_2bg?si=HuChTENo5__6BEsV) | Absolute Beginners



Made with ❤️ by [JayThree](https://github.com/giljr)