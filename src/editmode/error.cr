class Editmode::Error < Exception
  include JSON::Serializable
  property message : String?
end
