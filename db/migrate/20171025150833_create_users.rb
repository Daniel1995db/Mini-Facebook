class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.attachment :photo
      t.string :password
      t.string :position
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
