require_relative 'sherlock_db'
require_relative 'train'
require_relative 'util'
require 'gruff'

include SherlockDb

module Graph

  # (Profile, ProfileKind) => nil
  # writes a png in plots/profiles/{ID}.png
  def self.plot_profile(profile, profile_kind)
    g = Gruff::Bar.new
    normalized_anomaly = Util::compute_anomaly(profile, true)

    g.title = "profile: #{profile.id} - #{normalized_anomaly}"
    colors = {
      '0'  => '#fff',
      '0.1'  => '#eee',
      '0.2'  => '#ddd',
      '0.3'  => '#ccc',
      '0.4'  => '#bbb',
      '0.5'  => '#aaa',
      '0.6'  => '#999',
      '0.7'  => '#888',
      '0.8'  => '#777',
      '0.9'  => '#666',
    }
    puts normalized_anomaly
    puts normalized_anomaly.to_s
    colors[normalized_anomaly.to_s]
    g.theme = {
      background_colors: [colors[normalized_anomaly.to_s] || '#f55'] * 2,
    }
    labels = Train::get_bins_as_strings(profile_kind).map.with_index{|l, i|
      if i % 2 == 1
        "\n#{l}"
      else
        l
      end
    }
    g.labels = Hash[(0...labels.size).zip labels]
    g.label_max_size = 5
    g.marker_font_size = 10
    g.margins = 40
    data_label = "#{profile.month} - distance: #{profile.distance} (#{profile.normalized_distance})"
    g.data data_label, [20] + profile.normalize.histogram
    g.write("plots/profiles/profile_#{profile.id}.png")
  end

  # (int) => nil
  # writes a html file in reports/users/user_{ID}.html
  def self.save_amount_report
    o = ''
    Transfers.distinct.pluck(:user_id)[0..100].each_with_index{|user_id, i|
      o += user_amount_as_html(user_id)
      puts i if i % 100 == 0
    }
    File.write("reports/users/user_amount.html", o)
  end

  # (int) => nil
  # writes a html file in reports/users/user_{ID}.html
  def self.save_user_amount_report(user_id)
    File.write("reports/users/user_amount_#{user_id}.html", user_amount_as_html(user_id))
  end

  # (int) => nil
  # writes a html file in reports/users/user_{ID}.html
  def self.user_amount_as_html(user_id)
    pk = ProfileKinds.find(1)
    profiles = Profiles.where(user_id: user_id, profile_kind_id: 1).order(:month).to_a
    raise 'malformed histogram, nil bar' if profiles.any?{|p| p.histogram.any?{|bar| bar.nil?}}
    profiles.each{|p| plot_profile(p, pk)}
    o = "<h1>#{user_id}</h1>"
    o += profiles.map{|p| "<img src='../../plots/profiles/profile_#{p.id}.png'></img>\n"}.join
    o
  end

end
