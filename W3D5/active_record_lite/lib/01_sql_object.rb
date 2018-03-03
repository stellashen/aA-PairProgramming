require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns unless @columns.nil?

    result = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL

    # convert string to symbol
    # save columns to instance variable, so next time we get @columns directly
    @columns = result.first.map { |col| col.to_sym }
  end

  def self.finalize!
    cols = self.columns

    cols.each do |col|
      define_method("#{col}") do
        self.attributes[col]
      end

      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end

    #
    # cols.each do |col|
    #   p @attributes
    #
    #   val = DBConnection.execute(<<-SQL)
    #     SELECT
    #       "#{col}"
    #     FROM
    #       "#{self.class.table_name}"
    #   SQL
    #
    #   @attributes[col] = val
    # end
    # @attributes
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name.nil? # If table name has not been set
      self.to_s.tableize
    else
      @table_name
    end
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
