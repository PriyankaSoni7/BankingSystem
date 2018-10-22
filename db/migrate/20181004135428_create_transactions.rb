class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :operation
      t.references :account, index: true, foreign_key: true
      t.references :creditcard, index: true, foreign_key: true
      t.timestamps
    end
  end
end
