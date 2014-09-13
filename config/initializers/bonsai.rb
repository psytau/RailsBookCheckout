Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']
BONSAI_INDEX_NAME = "railsbookcheckout-production"
# Elasticsearch::Model.client = Elasticsearch::Client.new url: 'http://localhost:9200'
