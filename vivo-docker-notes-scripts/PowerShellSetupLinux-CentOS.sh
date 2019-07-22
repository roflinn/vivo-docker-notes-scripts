#!/bin/bash

# ------------------------------------------------------------------------------
# Pre-requisites
# A machine with CentOS 7.0 installed.
# A user with root/sudo permission on the machine.
# Instructions Originally from: https://www.tutorialspoint.com/articles/how-to-install-microsoft-powershell-on-centos-7-0
# Compiled By: Ralph O'Flinn

# https://github.com/PowerShell/PowerShell/releases/
# https://github.com/PowerShell/PowerShell/releases/download/v6.2.1/powershell-6.2.1-1.rhel.7.x86_64.rpm

wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.1/powershell-6.2.1-1.rhel.7.x86_64.rpm
sudo yum install powershell-6.2.1-1.rhel.7.x86_64.rpm

# Now, PowerShell is installed and ready for use run the PowerShell in the terminal –
# $ PowerShell
# PowerShell
# Copyright (C) Microsoft Corporation. All rights reserved.
# PS /root >
# PS /root> exit
# $

