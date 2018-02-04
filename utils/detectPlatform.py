#! /usr/bin/python

import platform

supported_dists = [
    'alpine',
    'system',
]

dist = platform.linux_distribution(supported_dists = supported_dists)
print dist[0] + ' ' + dist[1]
