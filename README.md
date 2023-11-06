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

- this concludes the end of our backend structure

## JOIN TABLES AND WHAT THEY REQUIRE
- since our application includes a join table we needed to add more things to our backend:
1. we modified our seeds to include the creation of memberships from the users and creating a connection between users and clubs through memberships
2. we created a new controller that is exclusive for the memberships with all the crud actions

3. we modified the routes to include memberships

4. we added validations for the membership resource

5. we included coverage to the membership controllers

6. these were the commands to ensure that the relations were working: 
p "user1 memberships", user1.memberships
p "user2 memberships", user2.membership
p "user1 clubs", user1.clubs
p "user2 clubs", user2.clubs
p "club1 memberships", club1.memberships
p "club2 memberships", club2.memberships
p "club3 memberships", club3.memberships
p "club1 users", club1.users
p "club2 users", club2.users
p "club3 users", club3.users

## API CONTROLLERS

1. we seed our data to ensure that we could see our users, our clubs and the memberships that ties them together

these are the commands in the Ruby console to see if the user has a club association through memberships:
  - user1 = User.find(1) <- first we define our user 
  - user1.clubs <- then we see if this user has clubs associated through the membership 

2. the controller methods for index, create, update, and delete have been created and the testing for them is also done 


