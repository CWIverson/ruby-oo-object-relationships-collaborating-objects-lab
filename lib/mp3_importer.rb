class MP3Importer
    def initialize(file_path)
        @path= file_path
    end
    def path
        @path
    end
    def files
        raw_list= Dir.entries(@path)
        list=[]
        raw_list.each do |file|
            if /.mp3/.match(file)
                list<<file
            end
        end
        list
       # binding.pry
    end
    def import
        self.files.each do |file|
        Song.new_by_filename(file)
        end
    end
end