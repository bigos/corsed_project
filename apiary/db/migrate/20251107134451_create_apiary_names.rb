class CreateApiaryNames < ActiveRecord::Migration[8.1]
  def change
    create_table :apiary_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
