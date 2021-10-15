# Author: Dan Trofimov (@DanTrofimov), 11-902
import os
import sys
import random
import time

print("Запущена программа Child в процессе с PID = %d c аргументом  %d" % (os.getpid(), int(sys.argv[1])));
time.sleep(int(sys.argv[1]));
print("Завершился процесс с PID %d" % (os.getpid()));
os._exit(random.randint(0,1));
