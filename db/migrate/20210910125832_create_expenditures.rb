class CreateExpenditures < ActiveRecord::Migration[6.1]
  def change
    create_table :expenditures do |t|
      t.float :value
      t.text :description
      t.date :date
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
