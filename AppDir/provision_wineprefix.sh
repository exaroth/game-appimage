#!/bin/bash
# This file is used for provisioning wineprefix in --provision-mode

export WINEDEBUG=${WINEDEBUG:-"fixme-all"}

$WINE wineboot

# Add provisioning for the wineprefix below
# eg.
#
# $WINE winetricks dxvk
