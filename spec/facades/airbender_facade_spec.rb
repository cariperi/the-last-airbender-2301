require 'rails_helper'

RSpec.describe 'Airbender Facade' do
  describe 'class methods' do
    it '#get_members(nation) method returns member objects for a specific nation' do
      members = AirbenderFacade.get_members('Fire+Nation')

      expect(members).to be_an(Array)

      members.each do |member|
        expect(member).to be_a(Member)
      end
    end
  end
end