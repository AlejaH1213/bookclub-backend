require 'rails_helper'

RSpec.describe Club, type: :model do
  it 'is not valid if name is empty' do
    club = Club.create(
      name: nil,
      summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
      meeting_dates: "1st and 3rd Fridays of each month",
      book_of_the_month: "The Fellowship of the Ring",
      book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
    )
    expect(club.errors[:name]).to_not be_empty
  end
  it 'is not valid if summary is empty' do
    club = Club.create(
      name: "Fantasy Book Club",
      summary: nil,
      meeting_dates: "1st and 3rd Fridays of each month",
      book_of_the_month: "The Fellowship of the Ring",
      book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
    )
    expect(club.errors[:summary]).to_not be_empty
  end
  it 'is not valid if meeting_dates is empty' do
    club = Club.create(
      name: "Fantasy Book Club",
      summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
      meeting_dates: nil,
      book_of_the_month: "The Fellowship of the Ring",
      book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
    )
    expect(club.errors[:meeting_dates]).to_not be_empty
  end
  it 'is not valid if book_of_the_month is empty' do
    club = Club.create(
      name: "Fantasy Book Club",
      summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
      meeting_dates: "1st and 3rd Fridays of each month",
      book_of_the_month: nil,
      book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
    )
    expect(club.errors[:book_of_the_month]).to_not be_empty
  end
  it 'is not valid if book_of_the_month_picture is empty' do
    club = Club.create(
      name: "Fantasy Book Club",
      summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
      meeting_dates: "1st and 3rd Fridays of each month",
      book_of_the_month: "The Fellowship of the Ring",
      book_of_the_month_picture: nil
    )
    expect(club.errors[:book_of_the_month_picture]).to_not be_empty
  end


end
