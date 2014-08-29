class CreateParishioners < ActiveRecord::Migration
  def change
    create_table :parishioners do |t|
      t.column :name, :string
      t.column :church_id, :integer
      
      t.timestamps
    end
  end
end
