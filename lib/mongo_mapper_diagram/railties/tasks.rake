namespace :mongo_mapper do
  desc "Generate Diagram from MongoMapper Document"
  task :diagram => :environment do
    Rails.application.eager_load!

    filename = ENV['filename']
    filename ||= './diagram'

    format = ENV['format']
    format ||= 'png'

    g = MongoMapperDiagram::Generator.new
    g.generate(filename, format.to_sym)
  end
end
