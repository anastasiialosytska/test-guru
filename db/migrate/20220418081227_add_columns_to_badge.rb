class AddColumnsToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule, :integer, default: 0
    add_column :badges, :parameter, :string
    add_column :badges, :description, :string
  end
end
