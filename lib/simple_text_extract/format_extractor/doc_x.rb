# frozen_string_literal: true

module SimpleTextExtract
  module FormatExtractor
    class DocX < Base
      def self.accept?(path)
        path.downcase.end_with?(".docx")
      end

      def extract
        return nil if missing_dependency?("unzip")

        `unzip -p #{Shellwords.escape(file.path)} | grep '<w:t' | sed 's/<[^<]*>//g' | grep -v '^[[:space:]]*$'`
      end
    end
  end
end
