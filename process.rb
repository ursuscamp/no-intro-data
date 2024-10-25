# frozen_string_literal: true

require 'nokogiri'
require 'csv'

# Directory containing dat files
xml_dir = ARGV[0]

# Array to store all rows before writing
all_rows = []

# Process each XML file in the directory
Dir.glob(File.join(xml_dir, '*.dat')).each do |xml_file|
  doc = File.open(xml_file) { |f| Nokogiri::XML(f) }

  # Extract system name from header
  system_name = doc.at_xpath('//header/name')&.text

  # Process each game entry
  doc.xpath('//game').each do |game|
    game_name = game['name']
    rom = game.at_xpath('.//rom')

    next unless rom

    md5 = rom['md5']
    sha1 = rom['sha1']

    # Store row in array
    all_rows << [system_name, game_name, md5, sha1]
  end
end

# Sort rows by system name (first column)
sorted_rows = all_rows.sort_by { |row| row[0].downcase }

# Write sorted data to CSV
CSV.open('games_database.csv', 'w') do |csv|
  # Write header row
  csv << %w[system name md5 sha1]

  # Write sorted data rows
  sorted_rows.each { |row| csv << row }
end
