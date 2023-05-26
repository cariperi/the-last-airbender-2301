class Member
  attr_reader :id,
              :name,
              :photo,
              :allies,
              :enemies,
              :affiliation

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @photo = data[:photoUrl]
    @allies = data[:allies]
    @enemies = data[:enemies]
    @affiliation = data[:affiliation]
  end
end