#!/bin/bash
# RUN AS SU OR SUDO

/opt/tomcat/bin/shutdown.sh
docker stop vitrodb2
docker stop vivosolr2
