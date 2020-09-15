require 'test_helper'

class CipherControllerTest < ActionDispatch::IntegrationTest
  test "should post to rot13" do
    post cipher_url, params: { cipher: { message: 'rotate me' } }, as:
      :json
    assert_response :success
  end

  test "should return the message" do
    post cipher_url, params: { cipher: { message: 'rotate me' } }, as: :json
    assert_equal JSON.parse(response.body), { "response" => 'ebgngr zr' }
  end

  test "returns 500 for no data" do
    post cipher_url, params: {}, as: :json
    assert_response :error
  end

  test "returns error message for no data" do
    post cipher_url, params: {}, as: :json
    assert_equal JSON.parse(response.body), { "error" => "server cannot handle input data" }
  end
end
