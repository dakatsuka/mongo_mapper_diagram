module MongoMapperDiagram
  class Document
    class << self
      def <<(document)
        @@documents ||= []
        @@documents << document
      end

      def all
        @@documents
      end
    end
  end
end
