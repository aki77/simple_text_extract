$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "simple_text_extract"

require "minitest/autorun"
require "mocha/minitest"

# Suppresses gem warning from Spreadsheet (see https://github.com/zdavatz/spreadsheet/pull/226)
$VERBOSE = false
