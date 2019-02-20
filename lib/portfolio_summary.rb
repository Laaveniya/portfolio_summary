#!/usr/bin/env ruby

class PortfolioSummary
  require_relative '../services/calculator.rb'
  require 'json'

  attr_reader :file_path

  OUTPUT_FILE_PATH ='output/daily_portfolio_values'.freeze

  def initialize(file_path)
   @file_path = file_path
  end

  def self.process(file_path)
    PortfolioSummary.new(file_path).process
  end

  def process
    values = prepare_portfolio_values
    File.write(OUTPUT_FILE_PATH, JSON.dump(values))
  end

  def prepare_portfolio_values
    portfolio_data.map do |portfolio_detail|
      investor_summary = {}
      investor_summary['date'] = portfolio_detail['date']
      calculator_service = Services::Calculator.new(portfolio_detail['holdings'], portfolio_detail['date'])
      investor_summary['holdings'] = calculator_service.process
      investor_summary
    end
  end

  def portfolio_data
    json_from_file = File.read(file_path)
    JSON.parse(json_from_file)
  end
end

#Comment the below to run tests
PortfolioSummary.process(ARGV[0])

