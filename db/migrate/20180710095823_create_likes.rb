class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|  #user와 post 브릿지테이블
      t.integer :user_id        #모델명_id
      # = t.belong_to :user
      
      t.integer :post_id
      # = t.belong_to :post
      t.timestamps null: false
    end
  end
end
