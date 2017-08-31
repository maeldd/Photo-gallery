class RemoveBusinessNameAndWebsiteFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :business_name, :string
    remove_column :users, :website, :string
  end
end
