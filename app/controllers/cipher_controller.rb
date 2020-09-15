require 'cipher'

class CipherController < ApplicationController
  def rotate
    render json: { response:
                   Cipher.rot13(params[:cipher][:message]) }
  rescue
    render json: { error: 'server cannot handle input data' },
      status: 500
  end
end
