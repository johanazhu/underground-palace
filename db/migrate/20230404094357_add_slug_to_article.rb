class AddSlugToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :slug, :string
  end

  add_index :articles, :slug
end
