# frozen_string_literal: true

module SimpleTextExtract
  module FormatExtractor
    class Xls < Base
      def self.accept?(path)
        path.downcase.end_with?(".xls")
      end

      def extract
        require "spreadsheet"

        spreadsheet = Spreadsheet.open(file)
        text = []
        spreadsheet.worksheets.each do |sheet|
          text << sheet.name
          text << sheet.rows
        end

        text.flatten.join(" ")
      end
    end
  end
end
