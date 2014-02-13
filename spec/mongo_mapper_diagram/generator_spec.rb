require "spec_helper"

class Author
  include MongoMapper::Document
  key :email, String
  key :nickname, String
  many :articles
  many :comments
end

class Article
  include MongoMapper::Document
  key :title, String
  key :body,  String
  many :comments
  belongs_to :author
  timestamps!
end

class Comment
  include MongoMapper::Document
  key :body, String
  belongs_to :author
  belongs_to :article
  timestamps!
end

describe MongoMapperDiagram::Generator do
  it "generates diagram" do
    gviz = Gviz.new(:G, :digraph)
    gviz.should_receive(:save).once.with("/tmp/test", :svg)

    generator = MongoMapperDiagram::Generator.new(nil, gviz)
    generator.generate("/tmp/test", :svg)

    nodes = gviz.instance_variable_get(:@nodes)
    expect(nodes).to be_key :Article
    expect(nodes).to be_key :Comment
    expect(nodes).to be_key :Author

    edges = gviz.instance_variable_get(:@edges)
    expect(edges).to be_key :Article_Author
    expect(edges).to be_key :Comment_Author
    expect(edges).to be_key :Comment_Article
  end
end
