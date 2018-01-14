class CreateCreateEncrypteds < ActiveRecord::Migration[5.1]
  def change
    create_table :create_encrypteds do |t|
      t.string :encrypted
	  t.integer :id_message
      t.timestamps
    end
  end
end
