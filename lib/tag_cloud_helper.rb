module TagCloudHelper
  def tags_cloud(model, limit=30)
    options = {
      :select => "count(taggings.id) as count_all, tags.name as tag_name, tag_id",
      :conditions => {:taggable_type => model.to_s },
      :joins => " left outer join tags on tags.id=taggings.tag_id" ,
      :group => 'tag_id',
      :order => 'count_all desc',
      :limit => limit
    }

    sql = Tagging.send(:construct_finder_sql, options)

    taggings = ActiveRecord::Base.connection.select_all(sql)

    return [] if taggings.blank?

    maxlog = Math.log(taggings.first['count_all'])
    minlog = Math.log(taggings.last['count_all'])
    rangelog = maxlog - minlog;
    rangelog = 1 if maxlog==minlog
    min_font = 10
    max_font = 30
    font_range = max_font - min_font
    cloud = []
    taggings = taggings.sort{|a,b| a['tag_name'] <=> b['tag_name']}

    taggings.each do |tagging|
      font_size = min_font + font_range * (Math.log(tagging['count_all']) - minlog)/rangelog
      cloud << [tagging['tag_name'], tagging['tag_id'], font_size.to_i, tagging['count_all']] 
    end
    
    the_cloud = cloud
     unless the_cloud.blank?
      output = '<div id="cloud">'
      
      the_cloud.each do |tag,id,fsize,count|
        output <<    "<span>"
        output <<    "<a title=\"count\""
        output <<        'alt="count"'
        output <<        "class=\"tag_#{id}\" "
        output <<        "style=\"font-size:#{fsize}px;\""
        output <<        "href=\"/articles/?tag=<%= tag -%>\">"
        output <<        tag + " "
        output <<    "</a>"
        output <<    "</span>"
      end 
      output << "</div>"
    end
    
    return output
  end
end