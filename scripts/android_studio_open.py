import os
import sys
import subprocess

def is_android_project(directory):
    """Checks for typical Android project markers."""
    has_settings_gradle = os.path.isfile(os.path.join(directory, "settings.gradle")) \
                          or os.path.isfile(os.path.join(directory, "settings.gradle.kts"))
    has_idea_folder = os.path.isdir(os.path.join(directory, ".idea"))
    has_iml_files = any(f.endswith(".iml") for f in os.listdir(directory))

    return has_settings_gradle or has_idea_folder or has_iml_files

def is_android_studio_running():
    try:
        result = subprocess.run(
            "ps aux | grep 'Android Studio' | grep -v grep", # grep 'Android Studio' will also list the grep search itself, so we need the second `grep -v grep` to remove the grep process.
            shell=True, # Allows running the string as a shell command.
            capture_output=True, # Captures the stdout and stderr, rather than print to the console. 
            text=True, # Converts stdout and stderr to text from raw data.
            check=False # If there's an error, no exception is raised. You need to manually check the return code.
        )
        
        # No error code (that is, 0) and stdout is not empty -> Android Studio was found.
        if result.returncode == 0 and result.stdout: 
            return True
        else:
            return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False

def open_android_studio(directory):
    """Opens the given directory in Android Studio."""
    if is_android_studio_running:
        subprocess.run(["open", "-a", "Android Studio"])
        sys.exit(0)
    else:
        subprocess.run(["open", "-a", "Android Studio", directory])
        sys.exit(0)

def main():
    current = os.getcwd()

    if is_android_project(current):
        open_android_studio(current)
        
    print("No Android Studio project found.")
    sys.exit(1)

if __name__ == "__main__":
    main()