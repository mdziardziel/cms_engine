require_dependency "cms_engine/application_controller"

module CmsEngine
  class TemplatesController < ApplicationController
    before_action :set_template, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    # GET /templates
    def index
      @templates = Template.all
    end

    # GET /templates/1
    def show
    end

    # GET /templates/new
    def new
      @template = Template.new(elements: [Element.new])
    end

    # GET /templates/1/edit
    def edit
    end

    # POST /templates
    def create
      @template = Template.new(template_params)

      if @template.save
        redirect_to templates_url, notice: 'Template was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /templates/1
    def update
      if @template.update(template_params)
        redirect_to templates_url, notice: 'Template was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /templates/1
    def destroy
      @template.destroy
      redirect_to templates_url, notice: 'Template was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_template
        @template = Template.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def template_params
        params.require(:template).permit(:name, :path, elements: [:key, :type, :content])
      end
  end
end
