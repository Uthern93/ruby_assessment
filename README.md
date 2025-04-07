# Ruby Blog App

This is a Ruby on Rails application that allows users to authenticate, register, create, read, update, and delete blog posts, as well as comment on them. The application includes user authentication using Devise and basic CRUD functionality for blog posts and comments.

## Features

- **User Authentication**: 
  - Register, Login, Logout
  
- **Blog CRUD Operations**:
  - Create, Read, Update, Delete blog posts.
  
- **Comments**:
  - Users can comment on blog posts.

## Installation

Follow the steps below to set up and run this application locally.

### Prerequisites

Ensure you have the following installed:
- Ruby (version 3.x)
- Rails (version 7.x)
- PostgreSQL

### Setup

1. Clone the repository:
   git clone https://github.com/Uthern93/ruby_assessment.git

2. Navigate to the project directory:
cd ruby_assessment

3. Install the required gems:
bundle install

4. Setup Database:
rails db:create
rails db:migrate

5. Start the Rails server:
rails server
