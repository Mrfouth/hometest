module Friends
  class API < Grape::API
    version :v1, using: :path, format: :json
    prefix :api
    format :json
    default_format :json

    helpers CommonHelper
    desc "Returns the current API version, v1."
    get do
      { version: 'v1' }
    end

    desc "default post method"
    post do
      { version: 'v1'}
    end

    desc 'add friend relation'
    get '/add_friends' do
      msg = []
      UserFriend.transaction do
        begin
          if validate_add_friends?
            UserFriend.create_relation(params[:friends])
            {"success": true}
          end
        rescue Exception => e
          error_code = 433
          error!({ error: "unexpected error", detail: "parameter or system error" }, error_code)
        end
      end
    end
  end
end
