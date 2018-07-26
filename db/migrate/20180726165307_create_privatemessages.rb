class CreatePrivatemessages < ActiveRecord::Migration[5.2]
  def change
    create_table :privatemessages do |t|
    	t.text :message_content
    	t.datetime :message_date
    	t.references :recipient, index: true
    	t.references :sender, index: true

      t.timestamps
    end
  end
end
