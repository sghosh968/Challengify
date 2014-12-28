class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.datetime :starts_on
      t.datetime :ends_on

      t.timestamps
    end
  end
end
