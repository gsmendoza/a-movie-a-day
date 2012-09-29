class AddResourceNameToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :resource_name, :string
  end
end
