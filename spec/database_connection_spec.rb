require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'Sets up the connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'Executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
