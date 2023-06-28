require "datastore"
require "json"

module Datastore
  class Collection
    include Enumerable

    def initialize(path, item_class)
      @items = JSON.load(File.open(path, "r") { |f| f.read })
      @item_class = item_class
    end

    def each
      @items.each { |h| yield @item_class.new(h) }
    end
  end
end
