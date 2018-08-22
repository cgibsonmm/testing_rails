class AddDownvotesToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :downvotes, :integer, null: false, default: 0
  end
end
