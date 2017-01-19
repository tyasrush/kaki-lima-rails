require 'test_helper'

class KakiLimasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kaki_lima = kaki_limas(:one)
  end

  test "should get index" do
    get kaki_limas_url
    assert_response :success
  end

  test "should get new" do
    get new_kaki_lima_url
    assert_response :success
  end

  test "should create kaki_lima" do
    assert_difference('KakiLima.count') do
      post kaki_limas_url, params: { kaki_lima: { alamat: @kaki_lima.alamat, closed: @kaki_lima.closed, kabupaten: @kaki_lima.kabupaten, kecamatan: @kaki_lima.kecamatan, kelurahan: @kaki_lima.kelurahan, lat: @kaki_lima.lat, lng: @kaki_lima.lng, lokasi: @kaki_lima.lokasi, nama: @kaki_lima.nama, open: @kaki_lima.open, phone: @kaki_lima.phone } }
    end

    assert_redirected_to kaki_lima_url(KakiLima.last)
  end

  test "should show kaki_lima" do
    get kaki_lima_url(@kaki_lima)
    assert_response :success
  end

  test "should get edit" do
    get edit_kaki_lima_url(@kaki_lima)
    assert_response :success
  end

  test "should update kaki_lima" do
    patch kaki_lima_url(@kaki_lima), params: { kaki_lima: { alamat: @kaki_lima.alamat, closed: @kaki_lima.closed, kabupaten: @kaki_lima.kabupaten, kecamatan: @kaki_lima.kecamatan, kelurahan: @kaki_lima.kelurahan, lat: @kaki_lima.lat, lng: @kaki_lima.lng, lokasi: @kaki_lima.lokasi, nama: @kaki_lima.nama, open: @kaki_lima.open, phone: @kaki_lima.phone } }
    assert_redirected_to kaki_lima_url(@kaki_lima)
  end

  test "should destroy kaki_lima" do
    assert_difference('KakiLima.count', -1) do
      delete kaki_lima_url(@kaki_lima)
    end

    assert_redirected_to kaki_limas_url
  end
end
