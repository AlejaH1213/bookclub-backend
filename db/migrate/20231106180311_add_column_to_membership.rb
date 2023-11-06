class AddColumnToMembership < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :name, :integer
  end
end
