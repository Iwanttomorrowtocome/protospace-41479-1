class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :title,     null:false     
      t.text :catch_copy,  null:false
      t.text :concept,     null:false
      t.references :user, null: false, foreign_key: true  # ここで user_id が作成される

      t.timestamps
    end
  end
end
