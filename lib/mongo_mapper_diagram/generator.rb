require "gviz"

module MongoMapperDiagram
  class Generator
    def initialize(documents = MongoMapperDiagram::Document.all)
      @documents = documents
    end

    def generate(filename, extension = :png)
      gviz = Gviz.new(:G, :digraph)

      @documents.each do |doc|
        gviz.node symbolize(doc), label: make_label(doc), shape: 'Mrecord'
      end

      @documents.each do |doc|
        doc.associations.each do |k, association|
          if association.instance_of? MongoMapper::Plugins::Associations::BelongsToAssociation
            gviz.route symbolize(doc) => symbolize(association.class_name)
          end
        end
      end

      gviz.save(filename, extension)
    end

    private
    def symbolize(document)
      document.to_s.gsub(/::/, '').to_sym
    end

    def humanize(document)
      document.to_s
    end

    def make_label(document)
      label =  "{#{humanize(document)}| "
      label += document.defined_keys.map {|name, key|
        name + " : " + key.type.to_s
      }.join('\l')
      label += "\\l}"
      label
    end
  end
end
