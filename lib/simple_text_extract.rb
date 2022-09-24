# frozen_string_literal: true

require "simple_text_extract/version"
require "simple_text_extract/text_extractor"
require "simple_text_extract/format_extractor/base"
require "simple_text_extract/format_extractor/plain_text"
require "simple_text_extract/format_extractor/pdf"
require "simple_text_extract/format_extractor/xls_x"
require "simple_text_extract/format_extractor/xls"
require "simple_text_extract/format_extractor/doc_x"
require "simple_text_extract/format_extractor/doc"
require "simple_text_extract/format_extractor/zip_extract"

module SimpleTextExtract
  class << self
    attr_accessor :format_extractors
  end

  self.format_extractors = [
    FormatExtractor::ZipExtract,
    FormatExtractor::PlainText,
    FormatExtractor::PDF,
    FormatExtractor::XlsX,
    FormatExtractor::Xls,
    FormatExtractor::DocX,
    FormatExtractor::Doc,
  ]

  class Error < StandardError; end

  def self.extract(filename: nil, raw: nil, filepath: nil, tempfile: nil)
    TextExtractor.new(filename: filename, raw: raw, filepath: filepath, tempfile: tempfile).to_s
  end

  def self.supports?(filename: nil)
    format_extractors.any? { |klass| klass.accept?(filename) }
  end

  def self.format_extractor_class(filename)
    format_extractors.detect { |klass| klass.accept?(filename) } || FormatExtractor::Base
  end
end
