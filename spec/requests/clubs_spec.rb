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
end