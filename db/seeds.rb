# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.where(email: "jane.austen@example.com").first_or_create(
    password: "password",
    password_confirmation: "password",
    username: "JaneAusten",
    profile_picture: "https://media.istockphoto.com/id/1292618730/photo/elegant-jane-austen-style-woman-strolling-a-courtyard.jpg?s=1024x1024&w=is&k=20&c=rUj70rq6t6KVVCtlW7FPFImCBpvZ2EVcbR6H4i2mKOg="
  ) 
user2 = User.where(email: "mark.twain@example.com").first_or_create(
    password: "password",
    password_confirmation: "password",
    username: "MarkTwain",
    profile_picture: "https://media.istockphoto.com/id/177793700/photo/postage-stamp-romania-1960-shows-mark-twain.jpg?s=1024x1024&w=is&k=20&c=IQ9jXpgpI48CkFDCt-qq3gjSwuza1ziU-50B7SI0CKE="
  )

  club1 = Club.create(
    name: "Fantasy Book Club",
    summary: "A club for fans of epic fantasy literature. Join us in exploring magical realms and heroic adventures.",
    meeting_dates: "1st and 3rd Fridays of each month",
    book_of_the_month: "The Fellowship of the Ring",
    book_of_the_month_picture: "https://media.istockphoto.com/id/522513933/photo/book-and-glowing-letters.jpg?s=1024x1024&w=is&k=20&c=8WfzoSTOdY66J5n4UUAdG-H3UbujWClS0Nxaq5Ai9l0="
  )

  club2 = Club.create(
    name: "Non-Fiction Book Club",
    summary: "Dive into the world of non-fiction literature. We explore topics ranging from history to science and self-help.",
    meeting_dates: "2nd and 4th Thursdays of each month",
    book_of_the_month: "Sapiens: A Brief History of Humankind",
    book_of_the_month_picture: "https://media.istockphoto.com/id/1447533975/photo/sign-on-library-shelves-non-fiction.jpg?s=1024x1024&w=is&k=20&c=Up_RUch-zaLe_PLZok66IraOMo-ydMSHehWDxPAcPNg="
  )

  club3 = Club.create(
    name: "Historical Book Club",
    summary: "Travel back in time with us to explore different eras, events, and figures in history through literature.",
    meeting_dates: "1st and 3rd Wednesdays of each month",
    book_of_the_month: "All the Light We Cannot See",
    book_of_the_month_picture: "https://images.unsplash.com/photo-1461360370896-922624d12aa1?auto=format&fit=crop&q=80&w=2948&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  )


  membership1 = user1.memberships.create(
    club: club1,
    name: 'first club'
  )

  membership2 = user2.memberships.create(
    club: club2,
    name: 'second club'
  )

  membership3 = user2.memberships.create(
    club: club3,
    name: 'third club'
  )

  

  