require 'rspec'
require 'portfolio_summary'

describe PortfolioSummary do
  it 'gives the portfolio summary for the investors' do
    file_path = File.dirname(__FILE__) + '/fixtures/portfolio.json'
    portfolio_summary_service = PortfolioSummary.new(file_path)
    values =  portfolio_summary_service.prepare_portfolio_values
    expected = [
      {
      'date' =>'2018-01-07',
      'holdings'=>{'AAA'=>232.59, 'RARI'=>600.66, 'VAP'=>279.90000000000003, 'VGS'=>242.5}
      }
    ]
    expect(values).to eq(expected)
  end
end
