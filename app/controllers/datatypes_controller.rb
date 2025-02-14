class DatatypesController < ApplicationController
  
  before_filter :admin_only
  
  # GET /datatypes
  # GET /datatypes.json
  def index
    @datatypes = Datatype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datatypes }
    end
  end

  # GET /datatypes/1
  # GET /datatypes/1.json
  def show
    @datatype = Datatype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datatype }
    end
  end

  # GET /datatypes/new
  # GET /datatypes/new.json
  def new
    @datatype = Datatype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datatype }
    end
  end

  # GET /datatypes/1/edit
  def edit
    @datatype = Datatype.find(params[:id])
  end

  # POST /datatypes
  # POST /datatypes.json
  def create
    @datatype = Datatype.new(params[:datatype])

    respond_to do |format|
      if @datatype.save
        format.html { redirect_to @datatype, notice: 'Datatype was successfully created.' }
        format.json { render json: @datatype, status: :created, location: @datatype }
      else
        format.html { render action: "new" }
        format.json { render json: @datatype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datatypes/1
  # PUT /datatypes/1.json
  def update
    @datatype = Datatype.find(params[:id])

    respond_to do |format|
      if @datatype.update_attributes(params[:datatype])
        format.html { redirect_to @datatype, notice: 'Datatype was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @datatype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datatypes/1
  # DELETE /datatypes/1.json
  def destroy
    @datatype = Datatype.find(params[:id])
    @datatype.destroy

    respond_to do |format|
      format.html { redirect_to datatypes_url }
      format.json { head :ok }
    end
  end
end
