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
