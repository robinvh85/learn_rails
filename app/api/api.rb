require 'grape-swagger'

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

    swagger_documentation_params = {
      doc_version: '1.0',
      info: {
        title: 'API endpoints documentation',
        description: 'Here is the place to reference our Renosy Insight API documentation',
        contact_name: 'Dev team',
        contact_url: 'https://localhost'
      },
      hide_documentation_path: true,
      hide_format: true
    }

    add_swagger_documentation(swagger_documentation_params)
  end
end
