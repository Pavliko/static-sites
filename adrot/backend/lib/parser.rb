require 'rubygems'
require 'nokogiri'
require 'rest-client'


class Parser
  attr_reader :urls, :selectors, :advertisements

  def initialize campaign
    campaign = campaign['camaign']
    @urls = campaign['pageUrl'].split("\n")
    @selectors = campaign['selectors'].map{|selector| selector['selector']}
    @advertisements = campaign['advertisements']
    @result = []
    @selectors.pop
    @advertisements.pop
  end

  def element_text selector, page
    set = page.css(selector)
    set.first.text.strip unless set.empty?
  end

  def parse
    urls.each { |url| parse_url url }
    @result
  end

  def parse_url url
    html = RestClient.get(url).body
    page = Nokogiri::HTML(html)

    i = 0
    data = selectors.each_with_object({}) do |selector, result|
      text = element_text(selector, page).strip
      result[selector.to_sym] = result[i.to_s.to_sym] = text if text
      i += 1
    end

    advertisements.each do |advertisement|
      banner = {}
      advertisement.each do |key, value|
        begin
          banner[key] = value % data
        rescue KeyError => e
          banner[key] = e.message
        end
      end
      @result << banner
    end

    advertisements
  end
end
