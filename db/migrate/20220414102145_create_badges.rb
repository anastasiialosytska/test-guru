class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :icon, null: false
      t.integer :rule, default: 0
      t.string :parameter
      t.string :description

      t.timestamps
    end
  end
end
