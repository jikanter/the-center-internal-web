class RegistrantsController < ApplicationController
  before_action :set_registrant, only: [:show, :edit, :update, :destroy]

  # GET /registrants
  # GET /registrants.json
  def index
    # Only find the registrants for the particular conference
    @registrants = Registrant.where(conference_id: params[:conference_id]).all
  end

  # GET /registrants/1
  # GET /registrants/1.json
  def show
  end

  # GET /registrants/new
  def new
    @registrant = Registrant.new
  end

  # GET /registrants/1/edit
  def edit
  end

  # POST /registrants
  # POST /registrants.json
  def create
    @registrant = Registrant.new(registrant_params)

    respond_to do |format|
      if @registrant.save
        format.html { redirect_to @registrant, notice: 'Registrant was successfully created.' }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :new }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrants/1
  # PATCH/PUT /registrants/1.json
  def update
    respond_to do |format|
      if @registrant.update(registrant_params)
        format.html { redirect_to @registrant, notice: 'Registrant was successfully updated.' }
        format.json { render :show, status: :ok, location: @registrant }
      else
        format.html { render :edit }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrants/1
  # DELETE /registrants/1.json
  def destroy
    @registrant.destroy
    respond_to do |format|
      format.html { redirect_to registrants_url, notice: 'Registrant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /registrants/actions/search?q=
  def search
    @registants = Registrants.search { fulltext params[:q] }
    respond_to do |format|
      format.html "search_results"
      format.json { render json: @registrants }
    end
  end

  # GET /registrants/actions/badges
  def badges
    # Generate SQL
    # first, make sure the id params can be safely converted to ints
    @ids = params[:badge].keys.select{ |id| id.to_i != 0 } if params[:badge] != nil
    #@ids = @ids.map{ |id| id.to_i }
    #@idwhereparams = "(" + ids.map{ |id| "id = #{id.to_i}" }.join(" OR ") + ")"
    #@sql = "SELECT * FROM registrants where conference_id = ? AND " + @idwhereparams
    if @ids != nil && @ids.length > 0
      @registrants = Registrant.where(conference_id: params[:conference_id], id: @ids).all
    else
      @registrants = Registrant.where(conference_id: params[:conference_id])
    end
    respond_to do |format|
      format.html { render "badges" }
      format.pdf do
        pdf = Badge.new(@registrants)
        send_data pdf.render, filename: 'badges.pdf', type: 'application/pdf', disposition: 'inline; filename="badges.pdf"'
      end
    end
  end
  

  private

    def set_conference
      @conference = Conference.find(params[:conference_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_registrant
      @registrant = Registrant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registrant_params
      params.require(:registrant).permit(:firstname, :lastname, :middleinitial, :homenumber, :homestreet, :homecity, :homestate, :homezip, :homephone, :cellphone, :businessname, :businessnumber, :businessstreet, :businesscity, :businessstate, :businesszip, :conference_id, :print_badge)
    end
end
