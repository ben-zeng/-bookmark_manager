require './lib/database_connection.rb'



describe DatabaseConnection do
  describe 'setup' do
    it 'it should set up and save connection to database' do
      test_connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.conn).to eq(test_connection)
    end
  end

  describe 'query' do
    it 'it should execute a given SQL query' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("select * from bookmarks")
      DatabaseConnection.query("select * from bookmarks")
    end
  end
end