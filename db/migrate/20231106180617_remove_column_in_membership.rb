class RemoveColumnInMembership < ActiveRecord::Migration[7.0]
  def change
    remove_column :memberships, :name
  end
end
