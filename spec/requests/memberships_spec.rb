require 'rails_helper'

RSpec.describe "Memberships", type: :request do
    let(:user) {User.create(
    username: "JaneAusten",
    email: "jane.austen@example.com",
    password: "password",
    password_confirmation: "password",
    profile_picture: "https://media.istockphoto.com/id/1292618730/photo/elegant-jane-austen-style-woman-strolling-a-courtyard.jpg?s=1024x1024&w=is&k=20&c=rUj70rq6t6KVVCtlW7FPFImCBpvZ2EVcbR6H4i2mKOg="
    )}
    let(:club1) {Club.create(
    name: "Fantasy Book Club",
    summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
    meeting_dates: "1st and 3rd Fridays of each month",
    book_of_the_month: "The Fellowship of the Ring",
    book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
  )}
  describe "GET /index" do
    it 'gets a list of the clubs' do
       membership = user.memberships.create( 
        club_id: club1.id,
        name: "Fantasy Book Club",
        user_id: user.id, 
      )

      get '/memberships'

      membership = JSON.parse(response.body)
      expect(membership.first['name']).to include 'Fantasy Book Club'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST/create" do
    it 'creates a new membership' do
      membership_params = {
        membership: {
          club_id: club1.id,
          user_id: user.id,
          name: "Fantasy Book Club"
        }
      }

      post '/memberships', params: membership_params

      expect(response).to have_http_status(200)

      membership = JSON.parse(response.body)

      expect(membership['name']).to include 'Fantasy Book Club'

      expect(user.memberships.count).to eq 1
    end
  end

  describe "PATCH /update" do
    it 'updates an existing membership' do
      membership_params = {
        membership: {
          club_id: club1.id,
          user_id: user.id,
          name: "Fantasy Book Club"
        }
      }

      post '/memberships', params: membership_params
      edit_membership = Membership.first
      expect(edit_membership['name']).to include 'Fantasy Book Club'

      edit_params = {
        membership: {
          club_id: club1.id,
          user_id: user.id,
          name: "Fantasy Club"
        }
      }

      patch "/memberships/#{edit_membership.id}", params: edit_params

      expect(response).to have_http_status(200)

      membership = JSON.parse(response.body)

      expect(membership['name']).to include 'Fantasy Club'
    end
  end

  describe "DELETE /destroy" do
    it "deletes an existing membership" do
      membership = user.memberships.create(
        club_id: club1.id,
        user_id: user.id,
        name: "Fantasy Club"
      )

      delete "/memberships/#{membership.id}"

      expect(response).to have_http_status(204)
      memberships = Membership.all
      expect(memberships.count).to eq 0
      expect(user.memberships.count).to eq 0
    end
  end

end
