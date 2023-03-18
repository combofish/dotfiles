#!/usr/bin/env python
# coding:utf-8
# Filename: org2md_cli.py

import os
import sys

markdown_title = '#'
org_title = '*'

org_begin_src  = '#+BEGIN_SRC'
org_end_src = '#+END_SRC'

md_begin_src = '```'
md_end_src = '```'

markdown_file_suffix = '.markdown'

org_result = '#+RESULTS:'

org_begin_example = '#+begin_example'
org_end_example = '#+end_example'

def turn_title(line):
    space = ' '
    real_title_index = line.index(space)
    line = markdown_title * real_title_index + line[real_title_index:]
    return line

def turn_begin_src(line):
    language = line.split()[1]
    line = md_begin_src + language + '\n'
    # line = md_begin_src +' ' + language + '\n'    
    return line

def turn_end_src(line):
    line = md_end_src + '\n'
    return line

def turn_result(line):
    line = ': result \n'
    return line

def turn_begin_example(line):
    line = md_end_src + 'c\n'
    return line

def turn_end_example(line):
    line = md_end_src + ' \n'
    return line


def process_out(s):
    if s.startswith(org_title):
        s = turn_title(s)

    s1 = s.strip()
    s2 = s.split()
    if s1.startswith(org_begin_src):
        s = turn_begin_src(s)
    elif s1.startswith(org_end_src):
        s = turn_end_src(s)
    elif s1.startswith(org_result):
        s = turn_result(s)
    elif s1.startswith(org_begin_example):
        s = turn_begin_example(s)
    elif s1.startswith(org_end_example):
        s = turn_end_example(s)
        
    # print(s)
    return s

def check_print(msg):
    check_message = '>>> Checking... '
    print(check_message,msg)


def check(orgfile):
    
    if orgfile[-4:] == '.org':
        check_print(orgfile)
    else:
        check_print('Error, ensure input a .org file!')
        return False

    if os.path.exists(orgfile):
        check_print(orgfile + ' exists!')
    else:
        check_print(orgfile + ' do not exists!')
        return False

    check_print('pass')
    return True


if __name__ == '__main__':
    orgfile = sys.argv[1]
    mdfile = orgfile[:-4] + markdown_file_suffix

    if check(orgfile):
        with open(orgfile,'rt') as orgfin:
            with open(mdfile,'wt') as mdfout:
                for line in orgfin:
                    # print(line)
                    line = process_out(line)
                    mdfout.write(line)

print('Program exit')
# print(mdfile)
