class CreateZens < ActiveRecord::Migration
  def change
    create_table :zens do |t|
      t.string :title
      t.string :photo
      t.string :link
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
