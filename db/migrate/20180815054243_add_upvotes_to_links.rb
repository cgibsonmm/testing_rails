class AddUpvotesToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :upvotes, :integer, default: 0
  end
end
