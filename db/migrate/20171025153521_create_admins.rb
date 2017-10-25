class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.references :user, foreign_key: true
      t.references :group

      t.timestamps
    end
  end
end