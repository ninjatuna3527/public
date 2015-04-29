#!/usr/bin/env python2
__author__="Richard Leeson"
import socket
from datetime import datetime
import time
import os
import platform
import sys

#check privs (need admin to instant start shaiya)
try:
  os.listdir(os.sep.join([os.environ.get('SystemRoot','C:\\windows'),'temp']))
except:
  raise Exception("Please restart this script with admin privileges")

#cygwin handling of os.system call if ran as shell script
if "CYGWIN" in platform.system():
  shaiya_cmd = "C:/AeriaGames/Shaiya/game.exe start game"
else:
  shaiya_cmd = "C:\\AeriaGames\\Shaiya\\game.exe start game"

#shaiya login server config as of 29/04/2015
shaiya_ip="108.163.135.198"
shaiya_port=30800

#status
tries=0
start_time = datetime.now()

while True:
  try:
	#socket setup
    TIMEOUT=0.4
    s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(TIMEOUT)
    s.connect((shaiya_ip,shaiya_port,))
    if s.recv(1024):
      for i in range(0,10):
        print "\a"
        time.sleep(0.5)
      os.system(shaiya_cmd)
      sys.exit(0)
  except (socket.timeout, socket.error) as e:
    tries+=1
    os.system("cls")
    print "started: {0}\ntries:{1}\ntime elapsed:{2}".format(start_time, tries, str(datetime.now()-start_time))
    time.sleep(5)
  
