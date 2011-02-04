# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def badword_length(word)
    @result = 0
    File.open("public/badwords.xml", "r").each do |line|
      line.match(/<badword>(.*?)<\/badword>/)
      value=$1
      if value
          if /(\b#{value.downcase}\b)/.match(word.downcase)
              @result += value.length
          end
      end
    end
    return @result
	end

  def get_data
    tmp = Array.new
    File.open("public/stream_data_29012011.json","r").each do |line|
      tmp << line
    end
    return tmp
  end
end
