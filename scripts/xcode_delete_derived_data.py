import os
import shutil
import sys

def remove_path(path):
    """Removes a file or directory if it exists."""
    if os.path.isfile(path):
        os.remove(path)
    elif os.path.isdir(path):
        shutil.rmtree(path)

def main():
    """Deletes Xcode Derived Data."""
    derived_data_dir = os.path.expanduser("~/Library/Developer/Xcode/DerivedData")

    if os.path.exists(derived_data_dir):
        remove_path(derived_data_dir)
        print("Xcode Derived Data has been deleted.")
    else:
        print("There was no Derived Data to remove.")

if __name__ == "__main__":
    main()