class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.integer :card_no
      t.strftime("%m/%d/%Y") :expiry_date
      t.strftime("%m/%d/%Y") :issue_date
      t.integer :cash_limit
      t.references :account, index: true, foreign_key: true
      t.timestamps
    end
  end
end