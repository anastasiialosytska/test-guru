class AddTestsUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :test
    end
  end
end
