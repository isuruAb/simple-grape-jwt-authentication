class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username null: false
      t.string :password_digest null: false
      t.boolean :active null: false, default: true

      t.timestamps
    end
  end
end
