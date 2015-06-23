class AddApiGitHubApiUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :git_api_url, :string
  end
end
