require 'rails'

module MongoMapperDiagram
  class Engine < Rails::Engine
    rake_tasks do
      load "mongo_mapper_diagram/railties/tasks.rake"
    end
  end
end
