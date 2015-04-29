#!/bin/python
__author__="Richard Leeson"
import socket
from datetime import datetime
import time
import os
import platform

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

#socket setup
TIMEOUT=0.4
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.settimeout(TIMEOUT)

#status
tries=0
start_time = datetime.now()

while True:
  try:
    s.connect((shaiya_ip,shaiya_port,))
    if s.recv(1024):
      for i in range(0,10):
        print "\a"
        time.sleep(0.5)
      os.system(shaiya_cmd)
  except (socket.timeout, socket.error) as e:
    tries+=1
    os.system("cls")
    print "started: {0}\ntries:{1}\ntime elapsed:{2}".format(start_time, tries, (datetime.now()-start_time).strftime("%Hh - %Mm - %Ss"))
  
