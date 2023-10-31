## Backend Structure
1. ran the commands to add devise: 
  - $ bundle add devise
  - $ rails generate devise:install
  - $ rails generate devise User
  - $ rails db:migrate

2. added the gems for the JSON Web Token 
  - gem 'devise-jwt'
  - gem 'rack-cors'

3. created a new cors.rb file and added the code that will allow the connection between our React app and our Rails API

4. generated a resource for Club with the following information:
  - name: string
  - summary: string
  - meeting_dates: string
  - book_of_the_month: string
  - book_of_the_month_picture: string

5. generated a resource for Membership with the following information:
  - user_id: integer 
  - club_id: integer

6. created associations between users, clubs, and memberships:
  
  class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memberships
  has_many :clubs, through: :memberships
  end

  class Club < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
  end

  class Membership < ApplicationRecord
    belongs_to :User
    belongs_to :club
  end

7. generated a new migration to add fields to the User model created by devise:
  - rails generate migration AddFieldsToUsers username:string profile_picture:string

8. added additional Devise Configurations

9. added the JWT Secret Key Configuration

10. configured devise and JWT

11. added jwt_denylist


