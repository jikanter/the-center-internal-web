# Proposals helper is just an extension of drive_time to make it work with oauth
# So as to not violate MVC, OauthSpreadsheetsConverter must be passed an
# access_token from the Token model.
# This should be converted to middleware or model, but shouldn't be here
module ProposalsHelper end

module DriveTime

  class OauthLoader < Loader

    # @params access_token: authenticated google api access token
    def begin_session(access_token=nil)
      access_token ||= Token.last.fresh_token
      # load the token
      @session = GoogleDrive.login_with_oauth(access_token)
    end

  end


  class OauthSpreadsheetsConverter < SpreadsheetsConverter

    def initialize
      # convert the spreadsheet with our new oauth loader. do everything the overridden method does
      # otherwise (why doesn't super work if I just want to change an instance variable?)
      @dependency_graph = DeepEnd::Graph.new
      @loader = OauthLoader.new
      @model_store = ModelStore.new(DriveTime::log_level)
      @class_name_map = ClassNameMap.new
    end

  end

end
