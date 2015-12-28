class CreateOkdbs < ActiveRecord::Migration
  def change
    create_table :okdbs do |t|

      t.string :name
      t.string :phoneNum
      t.integer :point  #다마수
      t.string :image
      t.float :average  #총점수
      t.integer :allscore   #총다마수
      t.integer :allinning  #총이닝수
      t.integer :count  #총경기횟수

      t.timestamps null: false
    end
  end
end
