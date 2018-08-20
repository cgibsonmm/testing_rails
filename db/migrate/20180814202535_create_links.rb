class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :link_title
      t.string :link_url

      t.timestamps
    end

    add_index :links, :link_url, unique: true
  end
end
