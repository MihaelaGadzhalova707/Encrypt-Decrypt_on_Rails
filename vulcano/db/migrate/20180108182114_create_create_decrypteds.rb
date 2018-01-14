class CreateCreateDecrypteds < ActiveRecord::Migration[5.1]
  def change
    create_table :create_decrypteds do |t|
      t.string :decrypted
      t.integer :id_key

      t.timestamps
    end
  end
end
