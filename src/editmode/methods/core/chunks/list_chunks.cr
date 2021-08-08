class Editmode::Chunk
  def self.list(project_id : String, collection_identifier : String? = nil)
    path_params = "project_id=#{project_id}"
    collection_identifier.try do |col_id|
      path_params = path_params + "&collection_identifier=#{col_id}"
    end

    response = Editmode.client.get("/chunks?#{path_params}")
    if response.status_code == 200
      Chunk::List.from_json(response.body)
    else
      raise Error.from_json(response.body)
    end
  end
end
