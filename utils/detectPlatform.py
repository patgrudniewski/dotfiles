#! /usr/bin/python

import platform

dist = platform.linux_distribution(supported_dists=['system'])
print dist[0] + ' ' + dist[1]
