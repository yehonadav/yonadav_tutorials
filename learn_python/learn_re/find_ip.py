import re
import socket


ip =' dsdf f 1.168.255.19/30 .7  20.5.8.3 500.2.2.0'


pattern = re.compile('\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')
matches = pattern.findall(ip)


print('ip address candidates:', matches)
for i, match in enumerate(matches):
    try:
        socket.inet_aton(match)
    except:
        del matches[i]
print('valid ip addresses:', matches)
