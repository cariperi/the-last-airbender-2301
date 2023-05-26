class AirbenderFacade
  def self.get_members(nation)
    members = service.get_members(nation)

    members.map do |member|
      Member.new(clean_member_data(member))
    end
  end

  private

  def self.service
    @_service ||= AirbenderService.new
  end

  def self.clean_member_data(member)
    {
      _id: member[:_id],
      allies: member[:allies].empty? ? ["None"] : member[:allies],
      enemies: member[:enemies].empty? ? ["None"] : member[:enemies],
      photoUrl: member.has_key?(:photoUrl) ? member[:photoUrl] : nil,
      name: member[:name],
      affiliation: member[:affiliation]
    }
  end
end
