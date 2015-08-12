class GooglesyncController < ApplicationController

  def init_api
    # for CORS compliance
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['X-Frame-Options'] = '*'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, Content-Type, X-PINGOTHER, X-File-Name, Cache-Control'
    response.headers['Access-Control-Allow-Methods'] = 'DELETE, GET, OPTIONS, POST, PUT'
    # Store the auth tokens
    @auth = request.env['omniauth.auth']['credentials']
    Token.create(
      access_token: @auth['token'],
      refresh_token: @auth['refresh_token'],
      expires_at: Time.at(@auth['expires_at']).to_datetime
    )
    # sync the proposals to google drive, then get them all
    ProposalsController.new.sync!
    @proposals = Proposal.all
    respond_to do |format|
      format.html { render 'sessions/sync', :layout => false }
    end
  end

end
