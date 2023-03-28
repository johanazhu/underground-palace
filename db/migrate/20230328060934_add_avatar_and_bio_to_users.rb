class AddAvatarAndBioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar, :string, default: "https://api.realworld.io/images/smiley-cyrus.jpeg"
    add_column :users, :bio, :string
  end
end
