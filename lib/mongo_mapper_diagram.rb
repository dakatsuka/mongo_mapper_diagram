require "mongo_mapper_diagram/version"
require "mongo_mapper_diagram/document"
require "mongo_mapper_diagram/generator"
require "mongo_mapper_diagram/engine" if defined?(Rails)

module MongoMapper::Document
  def self.included(klass)
    MongoMapperDiagram::Document << klass
  end
end
