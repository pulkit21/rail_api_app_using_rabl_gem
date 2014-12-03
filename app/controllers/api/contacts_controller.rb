class Api::ContactsController < ApplicationController
  before_action :set_post_id, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :authenticate_user!, :except =>[:create, :new]
  before_action :set_contact, only: [:show]
  respond_to :json
  # # GET /contacts
  # # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # # GET /contacts/1/edit
  # def edit
  # end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @post.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to posts_path, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_post_id
      @post = Post.find(params[:post_id])
    end

    def set_contact
      @contact = @post.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
