require 'rails_helper'

RSpec.describe 'Airbender Service' do
  it 'get_members(nation) method returns the Airbender API response' do
    members = AirbenderService.new.get_members('Fire+Nation')

    expect(members).to be_an(Array)

    members.each do |member|
      expect(member).to have_key(:_id)
      expect(member[:_id]).to be_a(String)

      expect(member).to have_key(:allies)
      expect(member[:allies]).to be_an(Array)

      expect(member).to have_key(:allies)
      expect(member[:allies]).to be_an(Array)

      expect(member).to have_key(:name)
      expect(member[:name]).to be_a(String)

      expect(member).to have_key(:affiliation)
      expect(member[:affiliation]).to be_a(String)
    end

    member = members.second
    expect(member).to have_key(:photoUrl)
    expect(member[:photoUrl]).to be_a(String)
  end
end