class Editmode::Chunk
  def self.retrieve(chunk_id : String)
    response = Editmode.client.get("/chunks/#{chunk_id}")

    if response.status_code == 200
      Chunk.from_json(response.body)
    else
      raise Error.from_json(response.body)
    end
  end

  def self.retrieve(content_key : String, project_id : String)
    response = Editmode.client.get("/chunks/#{content_key}?project_id=#{project_id}")

    if response.status_code == 200
      Chunk.from_json(response.body)
    else
      raise Error.from_json(response.body)
    end
  end
end
