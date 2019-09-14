require "./lang/*"

module Cadmium
  class Lang

    @classifier : Lang::Classifier

    def initialize(data_dir = "data/languages")
      @classifier = Lang::Classifier.new
      @classifier.load(data_dir)
    end

    # Returns the most likely language
    def detect(text : String)
      @classifier.categorize(text, 1).first[0]
    end

    def chance(text : String, results = 3)
      @classifier.categorize(text, results)
    end
  end
end

lang = Cadmium::Lang.new
puts lang.chance("Название страны происходит от этнонима ") # => ru
puts lang.chance("Якщо сторінка була тут створена нещодавно") # => uk

# classifier = Cadmium::Lang::Classifier.new
# classifier.load("data/languages")
# classifier.train_on("languages", true)
# classifier.save("data/languages")

# Dir["data/**/*.txt"].each do |file|
#   puts "On #{file}"
#   lines = File.read_lines(file)
#   last_line = lines.size > 800 ? 800 : lines.size
#   lines = lines[0, last_line]
#   File.write(file, lines.join('\n'), mode: "w")
# end
