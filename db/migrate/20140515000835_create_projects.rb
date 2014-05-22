class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client
      t.boolean :archived, default: false, null: false

      t.timestamps
    end
  end
end
