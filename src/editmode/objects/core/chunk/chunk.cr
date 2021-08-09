class Editmode::Chunk
  include JSON::Serializable

  getter identifier : String
  getter chunk_type : String
  getter project_id : String
  getter branch_id : String
  getter master_branch : Bool
  getter content_key : String?
  getter variable_fallbacks : Hash(String, String)?
  getter collection : Editmode::Collection?
  getter content : String | Array(Editmode::CollectionItem)

  def id
    identifier
  end
end
