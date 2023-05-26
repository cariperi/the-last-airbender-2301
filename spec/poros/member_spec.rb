require 'rails_helper'

RSpec.describe Member do
  before(:each) do
    data = {
      id: "5cf5679a915ecad153ab68cc",
      allies: ["Fire Nation"],
      enemies: ["Aang"],
      photoUrl: "https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128",
      name: "Afiko",
      affiliation: "Fire Nation"
    }

    member = Member.new(data)
  end

  it 'exists and has attributes' do
    expect(member).to be_a(Member)

    expect(member.id).to eq("5cf5679a915ecad153ab68cc")
    expect(member.allies).to eq(["Fire Nation"])
    expect(member.enemies).to eq(["Aang"])
    expect(member.photoUrl).to eq(["https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128"])
    expect(member.name).to eq("Afiko")
    expect(member.affiliation).to eq("Fire Nation")
  end
end