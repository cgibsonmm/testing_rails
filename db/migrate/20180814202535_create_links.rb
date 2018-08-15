class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :link_title
      t.string :link_url

      t.timestamps
    end
  end
end
