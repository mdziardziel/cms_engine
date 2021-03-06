require_dependency "cms_engine/application_controller"

module CmsEngine
  class ResourcesController < ApplicationController
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    # GET /resources
    def index
      @resources = Resource.all.order(:cms_engine_template_id, updated_at: :desc).includes(:template)
    end

    # GET /resources/1
    def show
    end

    # GET /resources/new
    def new
      @resource = Resource.new(elements: [Element.new])
    end

    # GET /resources/1/edit
    def edit
      if params[:version_timestamp].present?
        @resource = @resource.paper_trail.version_at(Time.zone.at(params[:version_timestamp].to_r))
      end
      @versions_datetimes = @resource.versions.order(created_at: :asc).pluck(:created_at).reverse
      @resources_with_other_languages = CmsEngine::Resource.where(name: @resource.name).where.not(language: @resource.language)
    end

    # POST /resources
    def create
      @resource = Resource.new(resource_params)
      @resource.elements = @resource.template.elements.map(&:attributes)

      if @resource.save
        redirect_to edit_resource_path(@resource), notice: 'Resource was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /resources/1
    def update
      if @resource.update(resource_params)
        redirect_to resources_url, notice: 'Resource was successfully updated.'
      else
        @versions_datetimes = @resource.versions.order(created_at: :asc).pluck(:created_at).reverse  
        @resources_with_other_languages = CmsEngine::Resource.where(name: @resource.name).where.not(language: @resource.language)
        render :edit
      end
    end

    # DELETE /resources/1
    def destroy
      @resource.destroy
      redirect_to resources_url, notice: 'Resource was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_resource
        @resource = Resource.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def resource_params
        params.require(:resource).permit(:cms_engine_template_id, :name, :path, :published, :language, elements: [:key, :type, :content])
      end
  end
end
