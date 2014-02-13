module MongoMapperDiagram
  class Document
    class << self
      @@documents = []

      def <<(document)
        @@documents << document
      end

      def all
        @@documents
      end
    end
  end
end
