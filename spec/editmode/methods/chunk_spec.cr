require "../../spec_helper"

describe Editmode::Chunk do
  it "retrieves a chunk with identifier" do
    WebMock.stub(:get, "https://api.editmode.com/chunks/cnk_4e86a1382b66a76f9c57")
      .to_return(status: 200, body: File.read("spec/support/retrieve_chunk.json"), headers: {"Content-Type" => "application/json"})

    chunk = Editmode::Chunk.retrieve("cnk_4e86a1382b66a76f9c57")
    chunk.id.should eq("cnk_4e86a1382b66a76f9c57")
  end
  it "returns an error when retrieving chunk with invalid identifier" do
    WebMock.stub(:get, "https://api.editmode.com/chunks/invalid_identifier")
      .to_return(status: 404, body: File.read("spec/support/retrieve_chunk_error.json"), headers: {"Content-Type" => "application/json"})

    expect_raises(Editmode::Error, "Chunk not found") do
      Editmode::Chunk.retrieve("invalid_identifier")
    end
  end
  it "list chunks" do
    WebMock.stub(:get, "https://api.editmode.com/chunks?project_id=prj_7H2yMxPljDci").to_return(status: 200, body: File.read("spec/support/list_chunks.json"), headers: {"Content-Type" => "application/json"})

    chunk_list = Editmode::Chunk.list("prj_7H2yMxPljDci")
    chunk_list.chunks.size.should eq(3)
    chunk_list.chunks[1].content.should be_a(String)
    chunk_list.chunks[2].content.should be_a(Array(Editmode::CollectionItem))
  end
end
