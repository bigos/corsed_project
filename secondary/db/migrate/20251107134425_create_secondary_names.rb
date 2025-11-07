class CreateSecondaryNames < ActiveRecord::Migration[8.1]
  def change
    create_table :secondary_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
