class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.belongs_to :project
      t.string :name

      t.timestamps
    end
    add_index :features, :project_id
  end
end
