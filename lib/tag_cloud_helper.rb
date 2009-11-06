
module TagCloudHelper

  def tag_cloud(facet, options)
    options  = {:limit => 30}.merge(options)
    taggings = facet[0..(options[:limit] - 1)]
    return [] if taggings.blank?

    maxlog = Math.log(taggings.first.count)
    minlog = Math.log(taggings.last.count)
    rangelog = maxlog - minlog;
    rangelog = 1 if maxlog == minlog
    min_font = 10
    max_font = 30
    font_range = max_font - min_font
    cloud = []
    taggings = taggings.sort { |a,b| a.value <=> b.value }

    taggings.each do |tagging|
      font_size = min_font + font_range * ( Math.log(tagging.count) - minlog ) / rangelog
      cloud << [tagging.value, font_size.to_i, tagging.count] 
    end
    
    the_cloud = cloud
    safe_params = params.delete_if {|key, value| %w{action controller page}.include? key }   

     unless the_cloud.blank?
      output = content_tag(:div, :id => options[:context].to_s.pluralize, :class => 'cloud') do   
        the_cloud.map do |tag, fsize, count|
          content_tag(:span) do  
            opts = {:title => tag, :alt => tag, :style => "font-size:#{fsize}px;", 
                    :class => "tag_#{count}", :id => "tag_#{tag}",
                    :href  => polymorphic_path(
                                eval("options[:model]").to_s.pluralize, safe_params.merge(
                                  eval("options[:context]") => tag)) }    
            content_tag(:a, tag + " ", opts)          
          end        
        end 
      end
    end
    
    return output
  end
end