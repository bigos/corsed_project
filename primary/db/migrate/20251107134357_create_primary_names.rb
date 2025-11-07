class CreatePrimaryNames < ActiveRecord::Migration[8.1]
  def change
    create_table :primary_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
