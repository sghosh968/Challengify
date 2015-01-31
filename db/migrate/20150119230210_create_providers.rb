class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :user, index: true
      t.string :provider_name
      t.string :uid
      t.string :token
      t.string :public_url
      t.string :auth_secret
      t.string :refresh_token

      t.timestamps
    end
  end
end
