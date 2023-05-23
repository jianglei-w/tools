#/bin/bash
# This script requires a positional parameter, which is the image name

# 是否为空
if [ -z ${1} ]; then 
    echo "err!!! position parameter is empty!!!"
fi

# 长度是否小于6
if [ $(expr length "$1") -lt 6 ]; then
    echo "This doesn't look like a image name, because it to short!"   
fi


push_tag=jiangleiww/`echo ${1} | awk -F / '{print $NF}'`

function start {
    docker pull ${1}

    docker tag ${1} ${push_tag}
    
    docker login

    docker push ${push_tag}

    echo ${push_tag}
}

# docker pull $1

start ${1}
# TODO: 先用着....