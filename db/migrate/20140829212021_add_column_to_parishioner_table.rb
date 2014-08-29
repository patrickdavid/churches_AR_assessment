class AddColumnToParishionerTable < ActiveRecord::Migration
  def change
    add_column :parishioners, :active, :boolean, {default:true}
  end
end
