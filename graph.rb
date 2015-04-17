require_relative 'sherlock_db'
require_relative 'train'
require 'gruff'

include SherlockDb

module Graph

  # (Profile, ProfileKind) => nil
  # writes a png in plots/profiles/{ID}.png
  def self.plot_profile(profile, profile_kind)
    g = Gruff::Bar.new
    g.theme = {
      background_colors: %w(#fff #fff),
    }
    g.title = "profile: #{profile.id}"
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
    g.data "#{profile.month} - distance: #{profile.distance}", profile.histogram
    g.write("plots/profiles/profile_#{profile.id}.png")
  end

  # (int) => nil
  # writes a html file in reports/users/user_{ID}.html
  def self.save_user_amount_report
    o = ''
    Transfers.distinct.pluck(:user_id)[0..100].each_with_index{|user_id, i|
      o += user_amount_as_html(user_id)
      puts i if i % 100 == 0
    }
    File.write("reports/users/user_amount.html", o)
  end

  # (int) => nil
  # writes a html file in reports/users/user_{ID}.html
  def self.user_amount_as_html(user_id)
    pk = ProfileKinds.find(1)
    profiles = Profiles.where(user_id: user_id, profile_kind_id: 1).to_a
    profiles.each{|p| plot_profile(p, pk)}
    o = "<h1>#{user_id}</h1>"
    o += profiles.map{|p| "<img src='../../plots/profiles/profile_#{p.id}.png'></img>\n"}.join
    o
  end

end
