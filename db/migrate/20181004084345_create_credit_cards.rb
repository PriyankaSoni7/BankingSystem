class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_no
      t.date :expiry_date
      t.date :issue_date
      t.integer :cash_limit
      t.references :account, index: true, foreign_key: true

      t.timestamps
    end
  end
end
