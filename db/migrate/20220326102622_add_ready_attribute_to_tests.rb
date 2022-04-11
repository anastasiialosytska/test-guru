class AddReadyAttributeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :is_ready, :boolean, null: false, default: false
  end
end
