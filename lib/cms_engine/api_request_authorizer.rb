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
      return false if jwt.nil?

      JWT.decode(jwt, public_key, true, { algorithm: algorithm })
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

    def public_key
      # temporary hardcoded, has to be changed to configurable by admin in the future
      key = <<~EOS
        -----BEGIN PUBLIC KEY-----
        MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnzyis1ZjfNB0bBgKFMSv
        vkTtwlvBsaJq7S5wA+kzeVOVpVWwkWdVha4s38XM/pa/yr47av7+z3VTmvDRyAHc
        aT92whREFpLv9cj5lTeJSibyr/Mrm/YtjCZVWgaOYIhwrXwKLqPr/11inWsAkfIy
        tvHWTxZYEcXLgAXFuUuaS3uF9gEiNQwzGTU1v0FqkqTBr4B8nW3HCN47XUu0t8Y0
        e+lf4s4OxQawWD79J9/5d3Ry0vbV3Am1FtGJiJvOwRsIfVChDpYStTcHTCMqtvWb
        V6L11BWkpzGXSW4Hv43qa+GSYOD2QU68Mb59oSk2OB+BtOLpJofmbGEGgvmwyCI9
        MwIDAQAB
        -----END PUBLIC KEY-----
      EOS
      OpenSSL::PKey::RSA.new(key).public_key
    end

    def algorithm
      # temporary hardcoded, has to be changed to configurable by admin in the future
      'RS512'
    end
  end
end
