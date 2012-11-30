import sys,re,os
d = os.listdir('.')
for i in d:
		f=open(i)
		a=f.read()
		if("SysCtlDelay" in a):
				print i
		f.close()
		del a
