class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :gender, null: false
      t.string :pronoun, null: false
      t.string :job_title, null: false
      t.string :years_of_experience, null: false
      t.string :location, null: false
      t.string :industry, null: false

      t.timestamps
    end
  end
end
