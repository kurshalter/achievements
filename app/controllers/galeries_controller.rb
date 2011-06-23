class GaleriesController < ApplicationController
  # GET /galeries
  # GET /galeries.xml
  def index
    @galeries = Galerie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galeries }
    end
  end

  # GET /galeries
  # GET /galeries.xml
  def galtable
    params[:heute] = Time.now.strftime('%b/%d')
    @galeries = Galerie.all

    respond_to do |format|
      format.html # galtable.html.erb
      format.xml  { render :xml => @galeries }
    end
  end

  # GET /galltm
  # GET /galltm.xml
  def galltm
    params[:zz]   = -1
    params[:heute] = Time.now.strftime('%b/%d')

    if params[:gal_id] 
      nil
    else  
       params[:gal_id] = 1
    end

    @galeries = Galerie.limit(8).order("date_galerie desc")
    @pictures = Picture.where(["galerie_id = ?", (params[:gal_id])]).order("date_orig")
    respond_to do |format|
      format.html # galtable.html.erb
      format.xml  { render :xml => @galeries }
    end
    
  end

  def show_avatar
    @galerie = Galerie.find(params[:id])
    send_data @galerie.picthumb, :type => 'image/jpg',:disposition => 'inline'
  end

  # GET /galeries/1
  # GET /galeries/1.xml
  def show
    @galerie = Galerie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @galerie }
    end
  end

  # GET /galeries/new
  # GET /galeries/new.xml
  def new
    @galerie = Galerie.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @galerie }
    end
  end

  # GET /galeries/1/edit
  def edit
    @galerie = Galerie.find(params[:id])
  end

  # POST /galeries
  # POST /galeries.xml
  def create
    @galerie = Galerie.new(params[:galerie])

    respond_to do |format|
      if @galerie.save
        format.html { redirect_to(@galerie, :notice => 'Galerie was successfully created.') }
        format.xml  { render :xml => @galerie, :status => :created, :location => @galerie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @galerie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galeries/1
  # PUT /galeries/1.xml
  def update
    @galerie = Galerie.find(params[:id])

    respond_to do |format|
      if @galerie.update_attributes(params[:galerie])
        format.html { redirect_to(@galerie, :notice => 'Galerie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @galerie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galeries/1
  # DELETE /galeries/1.xml
  def destroy
    @galerie = Galerie.find(params[:id])
    @galerie.destroy

    respond_to do |format|
      format.html { redirect_to(galeries_url) }
      format.xml  { head :ok }
    end
  end
end
