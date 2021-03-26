class Editmode::Collection
  include JSON::Serializable

  getter name : String
  getter identifier : String

  def id
    identifier
  end
end
