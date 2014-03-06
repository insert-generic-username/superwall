# See http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
    add_column :posts, :votes, :integer, :default => 0
    # add_column :posts, :url, :string
  end
end
