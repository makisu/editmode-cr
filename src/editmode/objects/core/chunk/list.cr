class Editmode::Chunk::List
  include JSON::Serializable
  include Enumerable(::Editmode::Chunk)

  getter chunks : Array(::Editmode::Chunk)

  def each(&block)
    chunks.each do |i|
      yield i
    end
  end
end
