class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|

      t.timestamps
      t.string :name,  null: false
      t.integer :genre_id, null: false
      t.text :description,  null: false 
      t.text :active,  null: false 
      t.text :flow,  null: false 
      t.text :become,  null: false 
      t.text :qualification,  null: false 
      t.text :salary,  null: false 
      t.text :rewarding,  null: false 
      t.text :busy,  null: false 
      t.text :correct,  null: false 
      t.text :aspiring,  null: false 
      t.text :status,  null: false 
      t.text :demand,  null: false 
      t.text :future,  null: false 
      t.references :user,     foreign_key: true 

    end
  end
end
