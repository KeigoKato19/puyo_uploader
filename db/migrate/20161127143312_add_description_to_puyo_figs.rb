class AddDescriptionToPuyoFigs < ActiveRecord::Migration
  def change
    add_column :puyo_figs, :description, :string
  end
end
