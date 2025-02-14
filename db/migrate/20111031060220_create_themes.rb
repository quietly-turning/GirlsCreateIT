class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.text :data
      t.string :preview_img

      t.timestamps
    end
  end
end
