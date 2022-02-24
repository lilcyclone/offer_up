class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :item_id
      t.integer :sender_id
      t.integer :recipient_id
      t.string :text

      t.timestamps
    end
  end
end
