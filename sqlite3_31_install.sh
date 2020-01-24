
checkSystem() {
    return $(lsb_release -a | grep -c "$1" ) -gt 0
}

installWget() {
    if [ checkSystem "Ubuntu" ] 
    then
        apt-get -yqq install wget
    elif [ checkSystem "CentOS" ] 
    then
        yum install wget
    fi
}

file_name="sqlite.tar.gz"
dir_name="sqlite-autoconf-3310000"

if [ ! test -e "/bin/wget" ] 
then
    installWget
fi

if [ ! test -e "./$file_name" ]
then
    wget 'https://www.sqlite.org/2020/sqlite-autoconf-3310000.tar.gz' \
    \ -c --tries=24 -O ./$file_name
fi

if [ $? -eq 0 ]
then

    tar zxvf $file_name
    cd $dir_name
    
    if [ -n $1 ]
    then
        $(./configure --prefix=/usr/local)
    else
        $(./configure --prefix=$1)
    fi
    make && make install
    
    if [ ! $? -eq 0 ]
    then
        echo 'SQLite install Failed !!'
    fi
else
    echo 'Error: Wget Exception? Or not exists?'
fi

echo 'OK ...'

