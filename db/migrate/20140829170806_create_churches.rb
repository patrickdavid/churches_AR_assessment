class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.column :name, :string
      
      t.timestamps
    end
  end
end
