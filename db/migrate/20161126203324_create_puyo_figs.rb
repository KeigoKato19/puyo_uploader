class CreatePuyoFigs < ActiveRecord::Migration
  def change
    create_table :puyo_figs do |t|
      t.string :name
      t.string :iframe

      t.timestamps null: false
    end
  end
end
