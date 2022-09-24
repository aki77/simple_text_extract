# frozen_string_literal: true

module SimpleTextExtract
  module FormatExtractor
    class PDF < Base
      def self.accept?(path)
        path.downcase.end_with?(".pdf")
      end

      def extract
        return nil if missing_dependency?("pdftotext")

        `pdftotext #{Shellwords.escape(file.path)} -`
      end
    end
  end
end
