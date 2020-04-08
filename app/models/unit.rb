class Unit < ApplicationRecord

  # Class Methods
  def self.get_uf_value_by_date(date)
    response = HTTParty.get("https://mindicador.cl/api/uf/#{date}")
    parsed_response = JSON.parse(response.body)
    
    if response.code == 200
      result = { 
        response: parsed_response['serie'][0]['valor'], code: response.code 
      }
    else
      result = { 
        response: 0, code: response.code 
      }
    end
  end
end
