class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string :title,         null: false
      t.string :comment,       null: true
      t.string :image,         null: false
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
