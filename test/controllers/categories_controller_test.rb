require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  # setup 메서드는 무엇일까? 왜 쓰는 것이지?
  def setup

    @category = Category.create(name: "cricket")

  end

  test "should get categories index" do

    get :index  # get의 의미는 http메서드 get을 뜻한다.

    assert_response :success # index를 가져오게 되면 success

  end

  test "should get new" do

    get :new

    assert_response :success

  end

  test "should get show" do

    get category_path(@category)

    assert_response :success

  end

end