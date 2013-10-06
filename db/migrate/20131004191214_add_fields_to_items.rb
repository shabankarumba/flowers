class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column(:items, :description, :string)
    add_column(:items, :currency, :string)
    add_column(:items, :image_link, :string)
  end
end
