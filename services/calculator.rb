module Services
  class Calculator
    require 'json'

    attr_reader :holdings_on, :holdings

    MARKET_DATA_FILE_PATH = 'data/market.json'

    def initialize(holdings, date)
      @holdings = holdings
      @holdings_on = date
    end

    def process
      holdings.each_with_object({}) do |(security_name, security_units), portfolio_values_hash|
        value = fetch_market_security_value(security_name, @holdings_on)
        portfolio_values_hash[security_name] = security_units.to_f * value.to_f
      end
    end

    def fetch_market_security_value(security_name, holdings_on)
      selected_market_data =
        market_data.find do |market|
          market['time'].split(' ')[0] == holdings_on && market['security'] == security_name
        end
      selected_market_data['price']
    end

    def market_data
      json_from_file = File.read(MARKET_DATA_FILE_PATH)
      JSON.parse(json_from_file)
    end
  end
end
