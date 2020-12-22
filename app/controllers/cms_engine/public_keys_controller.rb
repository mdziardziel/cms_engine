require_dependency "cms_engine/application_controller"

module CmsEngine
  class PublicKeysController < ApplicationController
    before_action :set_public_key, only: %i[edit update]
    before_action :authenticate_user!

    # GET /public_keys/1/edit
    def edit
    end

    # PATCH/PUT /public_keys/1
    def update
      if @public_key.update(public_key_params)
        redirect_to edit_public_key_path(@public_key), notice: t('cms_engine.public_keys.update.success')
      else
        render :edit
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_public_key
        @public_key = PublicKey.first || PublicKey.create(body: 'public key body', algorithm: PublicKey::ALGORITHMS.first)
      end

      # Only allow a trusted parameter "white list" through.
      def public_key_params
        params.require(:public_key).permit(:body, :algorithm)
      end
  end
end
