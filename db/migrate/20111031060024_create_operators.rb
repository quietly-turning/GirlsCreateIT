class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :name
      t.string :sql_value
      t.string :html_representation

      t.timestamps
    end
  end
end
