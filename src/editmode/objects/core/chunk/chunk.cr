class Editmode::Chunk
  include JSON::Serializable

  getter identifier : String
  getter chunk_type : String
  getter project_id : String
  getter branch_id : String
  getter master_branch : Bool
  getter content_key : String
  getter content : String

  def id
    identifier
  end
end
