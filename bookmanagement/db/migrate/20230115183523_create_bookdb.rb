class CreateBookdb < ActiveRecord::Migration[7.0]
  def change
    create_table :bookdbs do |t|
      t.string :bookName
      t.string :bookAuthor
      t.bigint :bookQuantity
      t.timestamps
    end
  end
end
