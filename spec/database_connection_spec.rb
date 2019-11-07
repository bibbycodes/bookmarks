require 'database_connection'

describe DatabaseConnection do
  context "Connecting to a database" do
    it 'connects to an SQL database' do
      expect(DatabaseConnection.setup("bookmark_manager_test")).to be_a(PG::Connection)
    end
  end

  context "making a query" do
    it 'makes a query to the database' do
      conn = DatabaseConnection.setup("bookmark_manager_test")
      expect(DatabaseConnection.query("SELECT * FROM bookmarks")).to be_a(PG::Result)
    end
  end
end