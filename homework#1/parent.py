#!/usr/bin/python3

# Author: Dan Trofimov (@DanTrofimov), 11-902
import os
import sys
import random
import time

N = int(sys.argv[1]);
ps = []
for i in  range (0, N):
    child_pid = os.fork();
    if (child_pid > 0):
        ps.append(child_pid);
    else:
        os.execl("./child.py", str(random.randint(5, 10));
while ps:
    child_pid, exit_code = os.wait()
    if child_pid == 0:
        time.sleep(random.randint(1, 10))
    else:
        print("Дочерний процесс с PID %d завершился. Статус завершения %d.", child_pid, exit_code)
        ps.remove(child_pid)