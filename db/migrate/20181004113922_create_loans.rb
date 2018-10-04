class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.string :loan_type
      t.integer :amount
      t.integer :int_rate
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
