import os
import sys
import glob
import subprocess

def find_project_in_directory(directory):
    """Finds an Xcode project or workspace in the given directory."""
    workspaces = glob.glob(os.path.join(directory, "*.xcworkspace"))
    projects = glob.glob(os.path.join(directory, "*.xcodeproj"))

    if len(workspaces) == 1:
        return workspaces[0]
    elif len(workspaces) > 1:
        print(f"Multiple workspaces found in {directory}, please specify manually.")
        sys.exit(1)

    if len(projects) == 1:
        return projects[0]
    elif len(projects) > 1:
        print(f"Multiple project files found in {directory}, please specify manually.")
        sys.exit(1)

    return None

def open_xcode(project):
    """Opens the given Xcode project or workspace."""
    if project:
        subprocess.run(["open", "-a", "Xcode", project])
        sys.exit(0)
    else:
        print("No Xcode project or workspace found.")
        sys.exit(1)

def main():
    """Finds and opens an Xcode project."""
    project = find_project_in_directory(os.getcwd())

    if not project:
        # Search one level deep in subdirectories
        for item in os.listdir():
            item_path = os.path.join(os.getcwd(), item)
            if os.path.isdir(item_path) and not item.startswith(".") and item != "Pods":
                project = find_project_in_directory(item_path)
                if project:
                    break

    open_xcode(project)

if __name__ == "__main__":
    main()