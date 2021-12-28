class AddAuthorIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author_id, :integer, foreign_key: true
  end
end
