class AddCompleteAttributeToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :complete, :boolean, null: false, default: false
  end
end
