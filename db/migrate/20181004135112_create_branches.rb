class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :address
      t.references :bank, index: true, foreign_key: true
      t.timestamps
    end
  end
end
