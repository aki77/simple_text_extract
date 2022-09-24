# frozen_string_literal: true

module SimpleTextExtract
  module FormatExtractor
    class PlainText < Base
      def self.accept?(path)
        path.match?(/(.txt$|.csv$)/i)
      end

      def extract
        file.read
      end
    end
  end
end
