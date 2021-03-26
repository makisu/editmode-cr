class Editmode::Chunk
  def self.list(project_id : String)
    response = Editmode.client.get("/chunks?project_id=#{project_id}")
    if response.status_code == 200
      Chunk::List.from_json(response.body)
    else
      raise Error.from_json(response.body)
    end
  end
end
