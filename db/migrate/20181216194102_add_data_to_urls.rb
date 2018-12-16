class AddDataToUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :clicks, :integer
    add_column :urls, :title, :string
  end
end
