class CheckinsController < ApplicationController
  before_filter :find_car

  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = @car.checkins

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkins }
    end
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
    @checkin = @car.checkins.find(params[:id])

    @nearby_checkins = Checkin.nearby_to(@checkin, 1000)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checkin }
    end
  end

  # GET /checkins/new
  # GET /checkins/new.json
  def new
    @checkin = Checkin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkin }
    end
  end

  # GET /checkins/1/edit
  def edit
    @checkin = @car.checkins.find(params[:id])
  end

  # POST /checkins
  # POST /checkins.json
  def create
    @checkin = @car.checkins.build(params[:checkin])

    if @checkin.valid?
      puts '---controller'
      puts @checkin.inspect
    end

    respond_to do |format|
      if @checkin.save
        format.html { redirect_to @checkin, notice: 'Checkin was successfully created.' }
        format.json { render json: @checkin, status: :created, location: @checkin }
      else
        format.html { render action: "new" }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checkins/1
  # PUT /checkins/1.json
  def update
    @checkin = @car.checkins.find(params[:id])

    respond_to do |format|
      if @checkin.update_attributes(params[:checkin])
        format.html { redirect_to @checkin, notice: 'Checkin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin = @car.checkins.find(params[:id])
    @checkin.destroy

    respond_to do |format|
      format.html { redirect_to checkins_url }
      format.json { head :no_content }
    end
  end

  private

  def find_car
    @car = Car.find(params[:car_id])
  end
end
