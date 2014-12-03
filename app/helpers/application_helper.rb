module ApplicationHelper
  class String
    def formatted
      title = self.split("_").map { |w| w.capitalize }
      title.join(" ")
    end
  end
end
