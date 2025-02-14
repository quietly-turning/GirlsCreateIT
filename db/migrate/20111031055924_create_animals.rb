class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :habitat
      t.boolean :nocturnal
      t.string :diet
      t.integer :weight

      t.timestamps
    end
  end
end
