module Extensions
  module Parser
    def self.registered(app)
      app.post '/parse' do
        json ::Parser.new(JSON.parse(request.body.read)).parse
      end
    end
  end
end
