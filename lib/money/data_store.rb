require 'sqlite3'

module Money
  class DataStore
    def self.instance
      @db ||= SQLite3::Database.new "money.db"
    end

    def self.close
      instance && instance.close
    end
  end
end
