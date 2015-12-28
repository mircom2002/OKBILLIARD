class CreateScoreboards < ActiveRecord::Migration
  def change
    create_table :scoreboards do |t|

      t.integer :winid
      t.integer :loseid
      t.integer :gameround
      t.integer :winpoint
      t.integer :losepoint
      t.datetime :gametime

      t.timestamps null: false
    end
  end
end
