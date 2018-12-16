class AddDataToUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :clicks, :integer, default: 0
    add_column :urls, :title, :string
  end
end
