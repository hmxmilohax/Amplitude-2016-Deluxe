# enable_keys.py
from pathlib import Path
import shutil
import os
try:
    import git
    print("module 'git' is installed. Downloading/enabling additional amp 2016 custom songs, this may take some time.")
except ModuleNotFoundError:
    print("module 'git' is not installed. Install it via '/dependencies/install_gitpython.bat' or 'pip install gitpython'")
    sys.exit(1)
    
# get the current working directory
cwd = Path().absolute()

# clone/pull amp songs
amp_songs_source_path = cwd.joinpath("amp-2016-customs")

try:
    repo = git.Repo.clone_from("https://github.com/jnackmclain/amp-2016-customs.git", amp_songs_source_path, branch="ps4")
except:
    repo = git.Repo(amp_songs_source_path)
    origin = repo.remotes.origin
    origin.pull()

amp_2016_songs_source_folder = cwd.joinpath("amp-2016-customs/songs")
amp_2016_customs_folder = cwd.joinpath("_ark/ps4/songs")
files = os.listdir(amp_songs_source_path)
shutil.copytree(amp_2016_songs_source_folder, amp_2016_customs_folder)

print(f"Successfully downloaded amp 2016 custom songs repo. Please rebuild in order to see them added in-game.")
