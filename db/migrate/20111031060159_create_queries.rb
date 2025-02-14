class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string  :name
      t.integer :dummy_id
      t.references :user, :null => false
      t.text  :formatted_sql
      t.text  :raw_sql
      t.text  :html_table
      
      t.timestamps
    end
    add_index :queries, :user_id    
  end
end
