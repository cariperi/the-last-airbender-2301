require 'rails_helper'

RSpec.describe 'Search Index Page', type: :feature do
  describe 'Searching for Members' do
    before(:each) do
      @all_members = AirbenderFacade.get_members(nation)

      visit root_path
      select 'Fire Nation'
      click_on 'Search for Members'
    end

    describe "When I visit the root path and select Fire Nation from the select field and click on Search for Members" do
      it "I should be on the page '/search' and see the total number of people who live in Fire Nation" do
          expect(current_path).to eq(search_path)
          expect(page).to have_content("Total Number of Members: #{@all_members.count}")
      end

      it "I should see a list with detailed information for the first 25 members of Fire Nation" do
          expect(page).to have_content("Member Details")
          expect(page).to have_css('.member', maximum: 25)
      end

      it "For each member I should see attributes name, allies, enemies, any affiliations" do
        members = @all_members.first(25)

        members.each do |member|
          within("#member-#{member.id}") do
            expect(page).to have_content(member.name)

            if member.allies.empty?
              expect(page).to have_content("None")
            else
              member.allies.each do |ally|
                expect(page).to have_content(ally)
              end
            end

            if member.enemies.empty?
              expect(page).to have_content("None")
            else
              member.enemies.each do |enemy|
                expect(page).to have_content(enemy)
              end
            end

            expect(page).to have_content("No affiliations")
          end
        end
      end

      it 'shows member photos when a member photo is available' do
        member = @all_members.first

        within("#member-#{member.id}") do
          expect(page).to have_css('img')
        end
      end
    end
  end
end
