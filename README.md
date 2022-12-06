# Synology-Bridge

## Activacion y automatizacion de conexion puente usando 2 ethernet
This script enables you to create a network bridge between two Ethernet ports on your Synology NAS.

## Prerequisite:
DiskStation Manager Version >= 7.1

Solo fue probado con 2 redes ethernet por ende esta modificado solo para esas

Administrator account on DSM

## Instruction

### Step 1 Upload the script to your NAS

Upload the script to an arbitrary folder.

You may have to give the right permission to the script.

### Step 2: Create a task if you wish it to autostart on boot.

Launch Control Panel on DSM and go to Task Scheduler.

Click “Create” button on the top. Select “Triggered Task” -->”User-defined script”.

Type any title you wish.

Choose the “Enable Task” box.

Move to “Task Setting” tab. 

Type 
> bash /Replace_with_your_path/vswitch_bridge.sh start 

to the textbox.

Click “OK” button.

Reboot if you want.

## Usage
vswitch_bridge.sh start
