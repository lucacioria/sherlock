require_relative 'histogram'
require_relative 'util'
require_relative 'sherlock_db'
require 'pp'
require "minitest/autorun"

include SherlockDb

class TestHistogram < Minitest::Test

  def setup
    @h = Histogram.new([0,1,2,3,4,5,6,7,8])
  end

  # test gaussian smooth

  def test_gaussian_smooth
    assert_equal [1.3775, 1.1778, 0.7551],
      Histogram.new([1,2,0]).gaussian_smooth(1, false).data.map{|x| x.round(4)}
    assert_equal [1, 1.1778, 0.8222],
      Histogram.new([1,2,0]).gaussian_smooth(1, true).data.map{|x| x.round(4)}
  end

  # test exp discount
  def test_exp_discount
    h = Histogram.new([-1, 1, 0, 17])
    assert_equal [-0.6065, 0.6065, 0, 10.3110],
      h.exp_discount(0.5, 1).data.map{|x| x.round(4)}
    assert_equal [-0.2231, 0.2231, 0, 3.7932],
      h.exp_discount(0.5, 3).data.map{|x| x.round(4)}
  end

  # test gaussian_array

  def test_gaussian_array
    expected = [0.07408743850884664,
                0.11884686185326673,
                0.15780966649577996,
                0.17345316539192726,
                0.15780966649577996,
                0.11884686185326673,
                0.07408743850884664]
    assert_equal expected, Histogram::gaussian_array(2.3, 3)
  end

  # test gaussian

  def test_gaussian
    assert_equal 0.1735, Histogram::gaussian(2.3, 0).round(4)
    assert_equal 0.1320, Histogram::gaussian(2.3, -1.7).round(4)
    assert_equal 0.1143, Histogram::gaussian(2.3, 2.1).round(4)
  end

  # test weighted_avg

  def test_weighted_avg_full
    assert_equal 1.5, Histogram::weighted_avg([1,2,1], [0,1,1])
    assert_equal 4/3.0, Histogram::weighted_avg([1,2,1], [1,1,1])
  end

  def test_weighted_avg_partial
    assert_equal 2, Histogram::weighted_avg([1,2,nil], [0,1,1])
  end

  def test_weighted_avg_negative_weight
    err = assert_raises RuntimeError do
      Histogram::weighted_avg([1,2],[1,-1])
    end
    assert_equal "negative weights", err.message
  end

  def test_weighted_avg_array_lengths
    err = assert_raises RuntimeError do
      Histogram::weighted_avg([1,2],[1])
    end
    assert_equal "value and weight arrays are of different lengths", err.message
  end

  # test neighbours

  def test_center
    assert_equal [1,2,3,4,5], @h.neighbours(2,3, false)
  end

  def test_min
    assert_equal [nil,0,1,2,3], @h.neighbours(2,1, false)
  end

  def test_max
    assert_equal [2,3,4,5,6,7,8,nil,nil], @h.neighbours(4,6, false)
  end

  def test_center_circular
    assert_equal [1,2,3,4,5], @h.neighbours(2,3, true)
  end

  def test_min_circular
    assert_equal [8,0,1,2,3], @h.neighbours(2,1, true)
  end

  def test_max_circular
    assert_equal [2,3,4,5,6,7,8,0,1], @h.neighbours(4,6, true)
  end

  def test_size_too_big
    err = assert_raises RuntimeError do
      @h.neighbours(9,5, false)
    end
    assert_equal "size too big", err.message
    err = assert_raises RuntimeError do
      @h.neighbours(9,5, true)
    end
    assert_equal "size too big", err.message
  end

end

class TestUtil < Minitest::Test

  def test_sliding_window
    assert_equal [[nil, nil, 1], [nil, 1, 2], [1, 2, 3]], Util::sliding_window([1,2,3], 3)
    assert_equal [[1], [2], [3]], Util::sliding_window([1,2,3], 1)
    assert_equal [[nil, nil, 1], [nil, 1, 2]], Util::sliding_window([1,2], 3)
  end

  def test_next_month
    assert_equal "2014-07", Util::next_month("2014-06")
    assert_equal "2014-12", Util::next_month("2014-11")
    assert_equal "2015-01", Util::next_month("2014-12")
  end

  def test_list_months_in_between
    assert_equal ["2014-03"], Util::list_months_in_between("2014-02", "2014-04")
    assert_equal ["2014-03", "2014-04"], Util::list_months_in_between("2014-02", "2014-05")
    assert_equal ["2014-11", "2014-12", "2015-01"],
      Util::list_months_in_between("2014-10", "2015-02")
    assert_equal [], Util::list_months_in_between("2014-02", "2014-03")
  end

  def test_fill_empty_months
    profiles = Profiles.where({user_id: '00e902f9083c711620d48fd155945380', profile_kind_id: 1}).where("histogram regexp '[1-9]'")
    filled = Util::fill_empty_months(profiles)
    assert_equal 2, profiles.length
    assert_equal 3, filled.length
    assert_equal true, filled[1].histogram.all?{|x| x == 0}
    assert_equal true, filled[1].profile_kind_id == filled[0].profile_kind_id
    assert_equal true, filled[1].user_id == filled[0].user_id
  end

end
