# No-Intro database processor

This script will process the no-intro database and output it into a CSV format for use in Larkade.

## Usage

1. Download a daily export in `Standard DAT` format from [https://datomatic.no-intro.org/index.php?page=download&s=64&op=daily](no-intro).
2. Extract the folder.
3. Execute `bundle exec process.rb path/to/unzipped/archive`.

Commit the `games_database.csv` to the git repo.
