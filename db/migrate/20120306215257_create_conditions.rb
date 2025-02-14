class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string      :column,    :null => false
      t.string      :parameter, :null => false
      t.references  :operator,  :null => false
      t.references  :query,     :null => false
      t.string      :complexOperator

      t.timestamps
    end
    add_index :conditions, :operator_id    
    add_index :conditions, :query_id    
  end
end