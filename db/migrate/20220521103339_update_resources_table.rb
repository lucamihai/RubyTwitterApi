class UpdateResourcesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :resources, :title, :string
    add_column :resources, :description, :string
    add_column :resources, :url, :string
    add_column :resources, :imageUrl, :string

    remove_column :resources, :name, :string
  end
end
