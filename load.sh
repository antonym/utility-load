#!/bin/bash

utility_check()
{
    if ! grep -qs "playbook=" /proc/cmdline
    then
        echo "[utility] Playbook not set... not doing anything..."
    exit 0
    fi
    echo "[utility] Playbook set... linking playbook to run on boot..."
    PLAYBOOK=`cat /proc/cmdline | grep -o 'playbook=[^ ,]\+' | awk -F'=' {'print $2'}`
    ln -s /opt/utility/$PLAYBOOK.yml /opt/utility/playbook.yml
}

run_playbook()
{
    cd /opt/utility
    git pull
    ansible-playbook -i localhost playbook.yml
}


main()
{
    utility_check
    run_playbook
}

main
