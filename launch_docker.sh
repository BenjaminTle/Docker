rm -rf ~/Library/Containers/com.docker.docker ~/Library/Containers/com.docker.helper
rm -rf ~/.docker
rm -rf /goinfre/${USER}/docker /goinfre/${USER}/agent /goinfre/${USER}/docker.helper
mkdir -p /goinfre/${USER}/docker /goinfre/${USER}/agent /goinfre/${USER}/docker.helper
ln -s /goinfre/${USER}/agent ~/Library/Containers/com.docker.docker
ln -s /goinfre/${USER}/docker ~/.docker
ln -s /goinfre/${USER}/docker.helper ~/Library/Containers/com.docker.helper
