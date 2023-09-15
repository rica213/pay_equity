class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :gender
      t.string :job_title
      t.integer :years_of_experience
      t.string :location
      t.string :industry

      t.timestamps
    end
  end
end
