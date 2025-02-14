class Page < ActiveRecord::Base
  belongs_to :theme
  belongs_to :user
  
   def wrap_page(queryTables)

     htmlChunks = self.content.split(/(<query>\d+<\/query>)/)
     content = String.new
     i = 0
     
     htmlChunks.each do |chunk|
       if (chunk.include? "<query>") and (chunk.include? "</query>")
         content += queryTables[i]
         i += 1
       else
         content += chunk
       end
     end
     


      if self.name.empty?
        self.name = "My GirlsCreateIT! Website"
      end

      prepend = '
  <html>
  	<head>
      <title>' + self.name + '</title>
  		<style type="text/css">' + self.theme.data + '</style>
  	</head>

    <body>
      <div id="everything">
        <div id="content">

        '

      append = '


        </div>
      </div>
      <div class="returnHome">
        <a href="../pages">Return to Home</a>
      </div>
    </body>
  </html>'

      page = prepend + content + append
      return page
    end




    # It seems I can't call ActiveRecord methods from within a model.
    # Well, that put a damper on my day.

    def parse_for_queries
      htmlChunks = self.content.split(/(<query>\d+<\/query>)/)
      
      ids = Array.new

      htmlChunks.each do |c|
        if (c.include? "<query>") and (c.include? "</query>")
          dummy_id = c.split(/<query>(\d+)<\/query>/)
          ids.push(dummy_id[1])
        end
      end
    
      return ids
    end
end