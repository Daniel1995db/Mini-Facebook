class CreateGroupchats < ActiveRecord::Migration[5.1]
  def change
    create_table :groupchats do |t|
      t.string :message
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
