class Editmode::CollectionItem
  include JSON::Serializable

  getter custom_field_identifier : String
  getter custom_field_name : String
  getter identifier : String
  getter chunk_type : String
  getter project_id : String
  getter branch_id : String
  getter master_branch : Bool
  getter content_key : String?
  getter content : String
end
