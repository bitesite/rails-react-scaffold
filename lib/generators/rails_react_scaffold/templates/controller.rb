class <%= controller_class_name %>Controller < ApplicationController
  <% if options[:use_cancan] %>load_and_authorize_resource<% else %>before_action :set_<%= singular_name %>, only: [:show, :edit, :destroy]<% end %>

  def index
    <% if !options[:use_cancan] %>@<%= plural_name %> = <%= class_name %>.all<% end %>

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
  end

  def create
    <% if !options[:use_cancan] %>@<%= singular_name %> = <%= class_name %>.new(<%= singular_name %>_params)<% end %>

    respond_to do |format|
      if @<%= singular_name %>.save
        format.json { render :show, status: :created, location: @<%= singular_name %> }
      else
        format.json { render json: @<%= singular_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @<%= singular_name %>.update(<%= singular_name %>_params)
        format.json { render :show, status: :ok, location: @<%= singular_name %> }
      else
        format.json { render json: @<%= singular_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @<%= singular_name %>.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    <% if !options[:use_cancan] %>def set_<%= singular_name %>
      @<%= singular_name %> = <%= class_name %>.find params[:id]
    end<% end %>

    def <%= singular_name %>_params
      params.require(:<%= singular_name %>).permit(<%= editable_attributes.map{|attribute| ":#{attribute.name}"}.join(", ") %>)
    end
end