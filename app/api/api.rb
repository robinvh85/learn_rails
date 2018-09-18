module API
  class Root < Grape::API

    # get api/v1/hello.xml
    content_type :xml, 'application/xml'
    content_type :json, 'application/json'
    content_type :txt, 'text/plain'
    default_format :json

    default_error_formatter :json
    format :json

    before do
      header 'X-Base-Header', 'will be defined for all APIs that are mounted below'
    end

    mount App::Root
  end
end
