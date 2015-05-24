class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :author
      t.datetime :date

      t.timestamps
    end
  end
end
