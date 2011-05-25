class FeaturesController < ApplicationController
  respond_to :html, :json

  expose(:project)
  expose(:feature)

  def index
    @features = Feature.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  def show
    @feature = Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  def new
    @feature = Feature.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  def edit
    @feature = Feature.find(params[:id])
  end

  def create
    @feature = Feature.new(params[:feature])

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to features_url }
      format.json { head :ok }
    end
  end
end
