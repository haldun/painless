class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.belongs_to :project
      t.belongs_to :feature
      t.belongs_to :user
      t.integer :priority
      t.integer :original_estimate
      t.integer :current_estimate
      t.integer :elapsed
      t.integer :remain

      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks, :feature_id
    add_index :tasks, :user_id
  end
end
