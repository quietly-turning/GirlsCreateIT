class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /pages
  # GET /pages.json
  def index
    if current_user
      @pages = Page.where(:user_id => current_user.id)
    else
      @pages = Page.where(:user_id => 1)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
    queryTables = Array.new
    dummy_ids = @page.parse_for_queries    

    if current_user
      uid = current_user.id
    else
      uid = @page.user_id
    end
    
    dummy_ids.each do |did|
      
      puts "dummy_id is #{did}"
      puts "user_id id #{uid}"
      query = Query.where("dummy_id = ? AND user_id = ?", did, uid).first
    
      queryTables << query.html_table
    end
    
     
    rendered_page = @page.wrap_page(queryTables)
    render :text => rendered_page
  end


  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    @queries = Query.where(:user_id => current_user.id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @queries = Query.where(:user_id => current_user.id)
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    if @page.theme_id == nil
      @page.theme_id = 1
    end
    
    @page.user_id = current_user.id
    
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end
  
  def for_groupid
    @queries = Query.find_all_by_group_id(params[:id]).sort_by{ |k| k['name'] }
        
    respond_to do |format|
      # format.html  { render :html => @queries }
      format.json  { render :json => @queries }      
    end
  end
  
end
