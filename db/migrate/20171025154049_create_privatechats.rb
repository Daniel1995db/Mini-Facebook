class CreatePrivatechats < ActiveRecord::Migration[5.1]
  def change
    create_table :privatechats do |t|

      t.timestamps
    end
  end
end
