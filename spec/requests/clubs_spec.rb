require 'rails_helper'

RSpec.describe "Clubs", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of the clubs' do
      
      club = Club.create( 
        name: "Fantasy Book Club",
        summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
        meeting_dates: "1st and 3rd Fridays of each month",
        book_of_the_month: "The Fellowship of the Ring",
        book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
      )

      get '/clubs'

      club = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(club.first['name']).to eq('Fantasy Book Club')
    end
  end

  describe "POST/create" do
    it 'creates a new club' do
      club_params = {
        club: {
          name: "Fantasy Book Club",
          summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
          meeting_dates: "1st and 3rd Fridays of each month",
          book_of_the_month: "The Fellowship of the Ring",
          book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
        }
      }
      post '/clubs', params: club_params

      club = JSON.parse(response.body)

      expect(club['name']).to eq 'Fantasy Book Club'
      expect(response).to have_http_status(200)
    end

    it 'is not valid if name is empty' do
      club_params = {
        club: {
          name: nil,
          summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
          meeting_dates: "1st and 3rd Fridays of each month",
          book_of_the_month: "The Fellowship of the Ring",
          book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
        }
      }
      post '/clubs', params: club_params
      expect(response.status).to eq(422)

      club = JSON.parse(response.body)
      expect(club['name']).to include("can't be blank")
    end

    it 'is not valid if summary is empty' do
      club_params = {
        club: {
          name: "Fantasy Book Club",
          summary: nil,
          meeting_dates: "1st and 3rd Fridays of each month",
          book_of_the_month: "The Fellowship of the Ring",
          book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
        }
      }
      post '/clubs', params: club_params
      expect(response.status).to eq(422)

      club = JSON.parse(response.body)
      expect(club['summary']).to include("can't be blank")
    end

    it 'is not valid if meeting dates is empty' do
      club_params = {
        club: {
          name: "Fantasy Book Club",
          summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
          meeting_dates: nil,
          book_of_the_month: "The Fellowship of the Ring",
          book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
        }
      }
      post '/clubs', params: club_params
      expect(response.status).to eq(422)

      club = JSON.parse(response.body)
      expect(club['meeting_dates']).to include("can't be blank")
    end

    it 'is not valid if book of the month is empty' do
      club_params = {
        club: {
          name: "Fantasy Book Club",
          summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
          meeting_dates: "1st and 3rd Fridays of each month",
          book_of_the_month: nil,
          book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
        }
      }
      post '/clubs', params: club_params
      expect(response.status).to eq(422)

      club = JSON.parse(response.body)
      expect(club['book_of_the_month']).to include("can't be blank")
    end

    it 'is not valid if book of the month picture is empty' do
      club_params = {
        club: {
          name: "Fantasy Book Club",
          summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
          meeting_dates: "1st and 3rd Fridays of each month",
          book_of_the_month: "The Fellowship of the Ring",
          book_of_the_month_picture: nil
        }
      }
      post '/clubs', params: club_params
      expect(response.status).to eq(422)

      club = JSON.parse(response.body)
      expect(club['book_of_the_month_picture']).to include("can't be blank")
    end
  end
end