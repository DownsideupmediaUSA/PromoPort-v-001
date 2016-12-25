module ApplicationHelper
  # def javascript_asset_path(basename)
  #   Sprockets::Rails::Helper.assets.paths.select{|i|
  #     i =~ /javascript/ and i =~ /#{Rails.root}/
  #   }.each do |directory|
  #     if Dir.entries(directory).map {|i| i.split('.')[0]}.compact.
  #         include? basename
  #       return File.join(directory, basename)
  #     end
  #   end
  #   nil
  # end
end
