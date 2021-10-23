class CreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :image
      t.date :foundation_date

      t.timestamps
    end
  end
end
