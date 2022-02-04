class CreatePhsicians < ActiveRecord::Migration[7.0]
  def change
    create_table :phsicians do |t|
      t.string :name
      t.string :email
      t.integer :unique_id

      t.timestamps
    end
  end
end
