class Editmode::Chunk
  def self.list(project_id : String, collection_identifier : String? = nil, as_string : Bool = false)
    path_params = "project_id=#{project_id}"
    collection_identifier.try do |col_id|
      path_params = path_params + "&collection_identifier=#{col_id}"
    end

    response = Editmode.client.get("/chunks?#{path_params}")
    if response.status_code == 200
      if as_string
        response.body
      else
        Chunk::List.from_json(response.body)
      end
    else
      raise Error.from_json(response.body)
    end
  end
end
