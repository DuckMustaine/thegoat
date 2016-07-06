class EditorsController < ApplicationController
  before_action :set_editor, only: [:show, :edit, :update, :destroy]

  # GET /editors
  # GET /editors.json
  def index
    if params[:search]
      @editors = Editor.order(created_at: :desc).search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @editors = Editor.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    end
  end

  def info
    if params[:search]
      @editors = Editor.order(created_at: :desc).search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @editors = Editor.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    end
  end

  # GET /editors/1
  # GET /editors/1.json
  def show
  end

  # GET /editors/new
  def new
    @editor = Editor.new
  end

  # GET /editors/1/edit
  def edit
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = Editor.new(editor_params)

    respond_to do |format|
      if @editor.save
        format.html { redirect_to @editor, notice: 'Texto criado com sucesso!' }
        format.json { render :show, status: :created, location: @editor }
      else
        format.html { render :new }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /editors/1
  # PATCH/PUT /editors/1.json
  def update
    respond_to do |format|
      if @editor.update(editor_params)
        format.html { redirect_to @editor, notice: 'Texto editado com sucesso!' }
        format.json { render :show, status: :ok, location: @editor }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor.destroy
    respond_to do |format|
      format.html { redirect_to editors_url, notice: 'Editor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor
      @editor = Editor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_params
      params.require(:editor).permit(:title, :post, :tags, :user_id)
    end
end