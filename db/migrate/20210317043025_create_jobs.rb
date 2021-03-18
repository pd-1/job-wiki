class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|

      t.timestamps
      t.string :name,  null: false
      t.text :content,  null: false
      t.references :user,     foreign_key: true 

    end
  end
end
