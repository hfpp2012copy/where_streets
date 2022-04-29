require "test_helper"

class WhereStreetsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::WhereStreets::VERSION
  end

  def test_provinces
    assert_equal 31,
                 WhereStreets.find_provinces.length
  end

  def test_cities
    assert_equal %w[广州市 韶关市 深圳市 珠海市 汕头市 佛山市 江门市 湛江市 茂名市 肇庆市 惠州市 梅州市 汕尾市 河源市 阳江市 清远市 东莞市 中山市 潮州市 揭阳市 云浮市],
                 WhereStreets.find_cities("广东省")
    assert_equal ["市辖区"], WhereStreets.find_cities("上海市")
  end

  def test_counties
    assert_equal %w[罗湖区 福田区 南山区 宝安区 龙岗区 盐田区 龙华区 坪山区 光明区],
                 WhereStreets.find_counties("广东省", "深圳市")
    assert_equal %w[黄浦区 徐汇区 长宁区 静安区 普陀区 虹口区 杨浦区 闵行区 宝山区 嘉定区 浦东新区 金山区 松江区 青浦区 奉贤区 崇明区],
                 WhereStreets.find_counties("上海市", "市辖区")
  end

  def test_towns
    assert_equal %w[梅陇镇 小漠镇 鹅埠镇 赤石镇 鮜门镇 联安镇 陶河镇 赤坑镇 大湖镇 可塘镇 黄羌镇 平东镇 海城镇 公平镇 附城镇 城东镇],
                 WhereStreets.find_towns("广东省", "汕尾市", "海丰县")
  end
end
