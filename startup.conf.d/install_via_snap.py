#!/usr/bin/env python
import subprocess


def check_and_install(package_names):
    res = subprocess.getoutput('sudo snap list')
    installed_pkgs = [item.split(' ')[0] for item in res.split('\n')[1:]]

    for name in package_names:
        if name not in installed_pkgs:
            subprocess.run(f"sudo snap install --classic {name}", shell=True)


if __name__ == '__main__':
    """ install packages via snap """
    pkg_names = [
        'clion',
        'code',
        'emacs',
        'pycharm-community',
        'pycharm-professional',
        'mysql-workbench-community'
    ]

    # sudo snap install dbeaver-ce

    check_and_install(pkg_names)

    subprocess.run("sudo snap refresh", shell=True)
