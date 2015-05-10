class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /articles
  # GET /articles.json
  def index
    request = "ending"
    @items = ApiHandler.get_items(request)
    @title = "Soon ending Auctions"
    render "items"
  end

  def bargains
    request = "bargains"
    @items = ApiHandler.get_items(request)
    @title = "Bargains"
    render "items"
  end

  def trending
    request = "trending"
    @items = ApiHandler.get_items(request)
    @title = "Trending Items"
    render "items"
  end

  def unrecognized
    request = "unrecognized"
    @items = ApiHandler.get_items(request)
    @title = "Unrecognized Items"
    render "items"
  end

  def search
    @items = ApiHandler.get_items(params[:search])
    @title = "Search results for: " + params[:search]
    render "items"
  end

  def wishlist
    @items = Article.update_articles(current_user.id)
    @items = @items.sort_by { |item| item[:ends_at] }
    @title = "Wishlist:"

    render "items"
  end

  def batch_destroy
    Article.batch_destroy(current_user.id)
    redirect_to wishlist_url, notice: 'All ended Items removed successfully.'
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_with(@article)
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @item = ApiHandler.get_items(article_params[:item_id])[0]
    @article = Article.new(
      item_id: @item[:id],
      auction_id: @item[:auction_id],
      estimate: @item[:estimate],
      next_bid_amount: @item[:next_bid_amount],
      category_id: @item[:category_id],
      ends_at: @item[:ends_at],
      currency: @item[:currency],
      state: @item[:state],
      title: @item[:title],
      condition: @item[:condition],
      item_type: @item[:type],
      location: @item[:location],
      url: @item[:url],
      transport_price: @item[:transport_price],
      description: @item[:description],
      reserve_met: @item[:reserve_met],
      image: @item[:images][0][:w640],
      user_id: current_user.id
    )



    respond_to do |format|
      if @article.save
        format.html { redirect_to wishlist_url, notice: 'Item successfully added to Wishlist.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    # @article = Article.where(id: params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to wishlist_url, notice: 'Item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit([
        :item_id,
        :auction_id,
        :estimate,
        :next_bid_amount,
        :category_id,
        :ends_at,
        :currency,
        :state,
        :title,
        :condition,
        :item_type,
        :location,
        :url,
        :image,
        :transport_price,
        :description,
        :reserve_met
      ]
    )
    end
end
