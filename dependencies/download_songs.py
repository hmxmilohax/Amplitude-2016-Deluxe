# enable_keys.py
from pathlib import Path
import shutil
import os
import sys

try:
    import git
    from git.exc import GitCommandError
    print("module 'git' is installed. Downloading/enabling additional Amp 2016 custom songs, this may take some time.")
except ModuleNotFoundError:
    print("module 'git' is not installed. Install it via '/dependencies/install_gitpython.bat' or 'pip install gitpython'")
    sys.exit(1)

# get the current working directory
cwd = Path().absolute()

# clone/pull amp songs
amp_songs_source_path = cwd / "amp-2016-customs"

try:
    repo = git.Repo.clone_from("https://github.com/jnackmclain/amp-2016-customs.git", amp_songs_source_path, branch="main")
except GitCommandError:
    repo = git.Repo(amp_songs_source_path)
    repo.remotes.origin.pull()

amp_2016_songs_source_folder = amp_songs_source_path / "songs"
amp_2016_customs_folder = cwd / "_ark" / "combined" / "songs"

if amp_2016_customs_folder.exists():
    shutil.rmtree(amp_2016_customs_folder)

shutil.copytree(amp_2016_songs_source_folder, amp_2016_customs_folder)

print("Successfully downloaded amp 2016 custom songs repo. Please rebuild in order to see them added in-game.")
