class AddProductionTypeColumnToProductions < ActiveRecord::Migration[6.1]
  def change
    add_column :productions, :production_type, :string
  end
end
