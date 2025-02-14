class QueriesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :js
  
  # GET /queries
  # GET /queries.json
  def index    
    if current_user
      @queries = Query.where(:user_id => current_user.id)
    else
      @queries = Query.where(:user_id => 1)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @queries }
    end
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    @query = Query.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @query }
    end
  end

  # GET /queries/new
  # GET /queries/new.json
  def new
    @query = Query.new
    @operators = Operator.all
    @condition = @query.conditions.build
  end

  # GET /queries/1/edit
  def edit
    @query = Query.find(params[:id])
    @operators = Operator.all
  end

  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(params[:query])
    @query.user_id = current_user.id
    @query.dummy_id = current_user.queries.count + 1
    
    # generate both raw sql string
    @query.processConditions
    @query.constructFormattedQuery
    @query.constructHTMLtable
    
    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, notice: 'Query was successfully created.' }
        format.json { render json: @query, status: :created, location: @query }
      else
        format.html { render action: "new" }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /queries/1
  # PUT /queries/1.json
  def update
    @query = Query.find(params[:id])
    
    respond_to do |format|
      if @query.update_attributes(params[:query])
        format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query = Query.find(params[:id])
    @query.destroy

    respond_to do |format|
      format.html { redirect_to queries_url }
      format.json { head :ok }
    end
  end
end
