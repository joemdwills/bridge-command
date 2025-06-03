#!/usr/bin/env python3

import os
from datetime import datetime
import argparse

def get_arguments():
    parser = argparse.ArgumentParser(description="Edit files to contain the date. By default the files are renamed with a timestamp, but it can be prepended if preferred.")
    parser.add_argument('file_paths', nargs='+', help="The paths to the files you want to rename.")
    parser.add_argument('-d', '--date', help="The date in DD/MM/YY or DD/MM/YYYY format. Uses today's date if not provided.", default=datetime.now().strftime('%d/%m/%Y'))
    parser.add_argument('-p', '--prepend', action='store_true', help="Prepend the date to the filename instead of appending.")
    return parser.parse_args()

def process_file(file_path, args):
    directory_path = os.path.dirname(file_path)
    filename = os.path.basename(file_path)
    file_extension = os.path.splitext(filename)[1]

    date_input = args.date
    # Convert the date_input string to a date object
    try:
        date_object = datetime.strptime(date_input, '%d/%m/%y').date()
    except ValueError:
        try:
            date_object = datetime.strptime(date_input, '%d/%m/%Y').date()
        except ValueError:
            print("The date format is incorrect. Please use DD/MM/YY or DD/MM/YYYY format.")
            return
        
    # Format the date string as YYYYMMDD
    date_string = date_object.strftime('%Y%m%d')
        
    if args.prepend:
        name_without_extension = os.path.splitext(filename)[0]
        new_file_name = f"{date_string}_{name_without_extension}{file_extension}"
    else:
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")
        new_file_name = f"{date_string}_{timestamp}{file_extension}"

    # Create the full path for the original and new file names
    original_file_path = os.path.join(directory_path, filename)
    new_file_path = os.path.join(directory_path, new_file_name)

    # Rename the file
    os.rename(original_file_path, new_file_path)

def main():
    args = get_arguments()
    for file_path in args.file_paths:
        process_file(file_path, args)

if __name__ == "__main__":
    main()
