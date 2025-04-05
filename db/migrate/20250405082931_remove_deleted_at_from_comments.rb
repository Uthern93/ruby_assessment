class RemoveDeletedAtFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :deleted_at, :datetime
  end
end
