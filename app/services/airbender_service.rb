class AirbenderService
  def get_members(nation)
    get_url("/api/v1/characters?affiliation=#{nation}")
  end

  def conn
    Faraday.new(url: 'https://last-airbender-api.fly.dev') do |f|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end