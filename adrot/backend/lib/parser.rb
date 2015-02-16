require 'rubygems'
require 'nokogiri'
require 'rest-client'


class Parser
  attr_reader :url, :selectors, :advertisements

  def initialize campaign
    campaign = campaign['camaign']
    @url = campaign['pageUrl']
    @selectors = campaign['selectors'].map{|selector| selector['selector']}
    @advertisements = campaign['advertisements']
    @selectors.pop
    @advertisements.pop
  end

  def element_text selector, page
    set = page.css(selector)
    set.first.text.strip unless set.empty?
  end

  def parse
    html = RestClient.get(url).body
    page = Nokogiri::HTML(html)

    i = 0
    data = selectors.each_with_object({}) do |selector, result|
      text = element_text(selector, page).strip
      result[selector.to_sym] = result[i.to_s.to_sym] = text if text
      i += 1
    end

    advertisements.each do |advertisement|
      advertisement.each do |key, value|
        begin
          advertisement[key] = value % data
        rescue KeyError => e
          advertisement[key] = e.message
        end
      end
    end

    advertisements
  end
end
