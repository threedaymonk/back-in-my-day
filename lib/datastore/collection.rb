require "datastore"
require "json"

class Datastore::Collection
  include Enumerable

  def initialize(path, item_class)
    @items = JSON.load(File.read(path))
    @item_class = item_class
  end

  def each(&) = @items.each { |h| yield @item_class.new(**h) }
end
