#!/bin/bash -e

echo "[Step 1] Initialising Setup..."
echo "=================================="
echo ""
sleep 2

##CREATE DIRECTORIES
echo "Creating Required Directories..."
echo ""
echo "+ BDS Root Directory..."
mkdir /opt/bdxcore
if [ -d /opt/bdxcore ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Data Volume Directory..."
mkdir /data
if [ -d /data ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Behaviour Packs Directory..."
mkdir /data/behavior_packs
if [ -d /data/behavior_packs ]; then
    echo "> Done!"
fi
sleep 1
echo "+ BDXC config Directory..."
mkdir /data/config
if [ -d /data/config ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Core_Dll Directory..."
mkdir /data/Core_Dll
if [ -d /data/Core_Dll ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Plugins Directory..."
mkdir /data/Plugin_Files
if [ -d /data/Plugin_Files ]; then
    echo "> Done!"
fi
sleep 1
echo "+ BDXCore Mod Directory..."
mkdir /data/Plugin_Files/bdxcore_mod
if [ -d /data/Plugin_Files/bdxcore_mod ]; then
    echo "> Done!"
fi
sleep 1
echo "+ .NET CSR Directory..."
mkdir /data/Plugin_Files/csr
if [ -d /data/Plugin_Files/csr ]; then
    echo "> Done!"
fi
sleep 1
echo "+ .NET JS Directory..."
mkdir /data/Plugin_Files/netjs
if [ -d /data/Plugin_Files/netjs ]; then
    echo "> Done!"
fi
sleep 1
echo "+ IronPython Directory..."
mkdir /data/Plugin_Files/ipy
if [ -d /data/Plugin_Files/ipy ]; then
    echo "> Done!"
fi
sleep 1
echo "+ BDSpyRunner Directory..."
mkdir /data/Plugin_Files/py
if [ -d /data/Plugin_Files/py ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Resource Packs Directory..."
mkdir /data/resource_packs
if [ -d /data/resource_packs ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Server Config Directory..."
mkdir /data/server_config
if [ -d /data/server_config ]; then
    echo "> Done!"
fi
sleep 1
echo "+ Worlds Directory..."
mkdir /data/worlds
if [ -d /data/worlds ]; then
    echo "> Done!"
fi
sleep 2
echo "[Step 1] Setup Complete!"