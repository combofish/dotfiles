#!/usr/bin/env python
import subprocess
from install_via_apt import startup_r

def check_and_install(package_names):
    res = subprocess.getoutput('sudo snap list')
    installed_pkgs = [item.split(' ')[0] for item in res.split('\n')[1:]]

    for name in package_names:
        if name not in installed_pkgs:
            startup_r(f"sudo snap install --classic {name}", prefix='install_via_snap')


if __name__ == '__main__':
    """ install packages via snap """
    pkg_names = [
        # 'clion',
        'code',
        'code-insiders',
        # 'emacs',
        # 'pycharm-community',
        # 'pycharm-professional',
        # 'mysql-workbench-community',
        # 'hugo'
    ]

    # sudo snap install dbeaver-ce

    check_and_install(pkg_names)

    startup_r("sudo snap refresh", prefix='install_via_snap')
