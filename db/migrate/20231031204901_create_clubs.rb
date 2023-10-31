class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :summary
      t.string :meeting_dates
      t.string :book_of_the_month
      t.string :book_of_the_month_picture

      t.timestamps
    end
  end
end
