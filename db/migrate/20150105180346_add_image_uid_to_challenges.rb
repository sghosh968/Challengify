class AddImageUidToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :image_uid, :string
  end
end
