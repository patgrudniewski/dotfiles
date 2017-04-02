#!/bin/python

import platform

dist = platform.dist()
print dist[0] + ' ' + dist[1]
