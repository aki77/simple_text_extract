# frozen_string_literal: true

module FastTextExtract
  module FormatExtractor
    class DocX < Base
      def extract
        `unzip -p #{Shellwords.escape(file.path)} | grep '<w:t' | sed 's/<[^<]*>//g' | grep -v '^[[:space:]]*$'`
      end
    end
  end
end
