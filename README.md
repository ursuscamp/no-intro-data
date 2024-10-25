# No-Intro database processor

This script will process the no-intro database and output it into a CSV format for use in Larkade.

## Usage

1. Download a daily export in `Standard DAT` format from [https://datomatic.no-intro.org/index.php?page=download&s=64&op=daily](no-intro).
2. Extract the folder. We want to point this script to the `No-Intro` folder inside the archive, which contains a lot of `.dat` files. Each `dat` file corresponds to a gaming system.
3. Execute `bundle exec process.rb path/to/no-intro/folder`

Commit the `games_database.csv` to the git repo.
