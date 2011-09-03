desc 'scrap irish convicts from the Irish National Archive'
task :scrap_irish_convicts => :environment do
  CSV_COLUMNS = [
                  "Last name:", "First name:", "Full name:", "Alias:", "Sex:", "Age:", "Trial place:", 
                  "Trial date:", "Imprisonment place:", "Crime desc:", "Document date:", "Sentence:", 
                  "Ship:", "Petitioner:", "Relationship", "Document ref1:", "Document ref2:", "Document ref3:", 
                  "Microfilm ref2:", "Microfilm ref3", "Comment1:", "Comment2:", "Comment field number:"
                ]

  File.open('irish_convicts.csv', 'w') do |f|
    f.puts CSV_COLUMNS.join(",")
    convicts_found = 1
    page = 1
    while convicts_found > 0
      doc = Nokogiri::HTML(open(irish_url_for_page(page)))
      doc.css('.searchResult table').each do |convict_table|
        convict_details = Hash[
          convict_table.css('.searchResultItem').collect do |convict_column|
            label_column = convict_column.at_css('th')
            value_column = convict_column.at_css('td')
            [label_column.inner_text.strip, (value_column.inner_text.strip rescue nil)]
          end
        ]
        f.puts CSV_COLUMNS.collect { |c| %|"#{convict_details[c]}"| }.join(",")
      end
      convicts_found = doc.css('.searchResultItem').size
      p "Downloaded page: #{page}"
      page += 1
      sleep 1
    end
  end

  p "Done. See: irish_convicts.csv"
end


def irish_url_for_page(page)
  "http://www.nationalarchives.ie/search/index.php?varmatchnames%5B0%5D=record_last_name&varmatchoperators%5B0%5D=isnotnull&varmatchvalues%5B0%5D=&scopeincludes%5B0%5D=147&category=18&advanced=true&advancedSearchSbm=Submit&style=null&offset=#{(page - 1) * 10}"
end
