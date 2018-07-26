class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
    	t.string :gossip_title
    	t.text :gossip_content
    	t.datetime :gossip_date
    	t.belongs_to :user, index: true


      t.timestamps
    end
  end
end
