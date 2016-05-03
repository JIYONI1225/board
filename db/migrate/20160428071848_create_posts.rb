class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      
      t.string :title
      t.text   :content
      t.integer :post_long
      t.integer :post_hio



      t.timestamps null: false
    end
  end
end
