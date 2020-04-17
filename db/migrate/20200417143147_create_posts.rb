class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string :title,         null: false
      t.string :content,       null: true
      t.string :image,         null: false
      t.string :url

      t.timestamps
    end
  end
end
