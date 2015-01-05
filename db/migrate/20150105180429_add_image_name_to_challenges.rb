class AddImageNameToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :image_name, :string
  end
end
