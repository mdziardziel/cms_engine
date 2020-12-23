require 'jwt'

module CmsEngine
  class ApiRequestAuthorizer
    delegate :headers, :params, to: :request

    def initialize(request)
      @request = request
    end

    def authorized?
      return true if signature_correct?

      false
    rescue JWT::VerificationError, JWT::DecodeError
      false
    end

    private

    attr_reader :request

    def signature_correct?
      return false if jwt.nil? || public_key_body.nil?

      JWT.decode(jwt, public_key_body, true, { algorithm: algorithm })
    end

    def jwt
      @jwt ||= jwt_from_header || jwt_from_params
    end

    def jwt_from_header
      return if headers['Authorization'].nil?

      headers['Authorization'].split(' ').last
    end

    def jwt_from_params
      params[:jwt] || params[:authorization]
    end

    def public_key_body
      @public_key_body ||= OpenSSL::PKey::RSA.new(public_key.body)&.public_key
    rescue OpenSSL::PKey::RSAError
      nil
    end

    def algorithm
      public_key&.algorithm
    end

    def public_key
      @public_key ||= PublicKey.first
    end
  end
end
