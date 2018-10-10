#!/usr/bin/env python3

"""download this for windows: https://www.winpcap.org/install/
we should consider using pip install WinPcapy instead
"""

from scapy.all import *


# sniff(prn=lambda x: x.show(), filter="host x.x.x.x", store=0)


stars = lambda n: "*" * n

def GET_print(packet):
    return "\n".join((
        stars(40) + "GET PACKET" + stars(40),
        "\n".join(packet.sprintf("{Raw:%Raw.load%}").split(r"\r\n")),
        stars(90)))

sniff(prn=GET_print, filter="host x.x.x.x", store=0)
