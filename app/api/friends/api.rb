module Friends
  class API < Grape::API
    version :v1, using: :path, format: :json
    prefix :api
    format :json

    desc "Returns the current API version, v1."
    get do
      { version: 'v1' }
    end

    desc "default post method"
    post do
      { version: 'v1'}
    end
  end
end
