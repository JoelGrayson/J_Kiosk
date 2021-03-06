#!/bin/bash

# Source this file to access `j_kiosk` command

j_kiosk() {
    #* Methods
	j_kiosk_help() { #local function not defined outside
		echo "Parameter (such as 'j_kiosk enable')"
		echo "# Porcelain (high-level commands)"
		echo "* on - enable & start"
		echo "* off - disable, stop, & reboot"
		echo "# Plumbing (low-level)"
		echo "* enable"
		echo "* disable"
		echo "* start"
		echo "* status"
		echo "* js (options node interactive version)"
	}

    on() {
        echo "~~~Turning ON~~~"
        sudo systemctl enable kiosk.service
        sudo systemctl start kiosk.service
    }

    off() {
        echo "~~~Turning OFF~~~"
        
        echo "Disabling"
        sudo systemctl disable kiosk.service
        echo "Stopping"
        sleep 3
        sudo systemctl stop kiosk.service
        echo "Rebooting"
        sleep 3
        sudo reboot
    }

    enable() {
        echo "~~~Enabled j_kiosk~~~"
        echo "Type 'sudo reboot' to disable"

        sudo systemctl enable kiosk.service
    }

    disable() {
        echo "~~~Disabling kiosk~~~"
        echo "Type 'sudo reboot' to disable"

        sudo systemctl disable kiosk.service
    }

    start() {
        echo "~~~Starting kiosk~~~"

        sudo systemctl start kiosk.service
    }

    stop() {
        echo "~~~Stopping kiosk~~~"

        sudo systemctl stop kiosk.service
    }

    status() {
        echo "~~~Getting Status of kiosk.service~~~"

        sudo systemctl status kiosk.service
    }

    js() {
        node /home/pi/J_Kiosk/j_rc\ node/j_kiosk.js #runs interactive version of j_kiosk javascript
    }

    #* Connect Methods

    called=false

    # Help
	[ -z "$1" ] || [ "$1" = 'help' ] && called=true && j_kiosk_help

    # Porcelain
    [ "$1" = "on" ]  && called=true && on
    [ "$1" = "off" ] && called=true && off

    # Plumbing
    [ "$1" = "enable" ]  && called=true && enable
    [ "$1" = "disable" ] && called=true && disable
    [ "$1" = "start" ]   && called=true && start
    [ "$1" = "stop" ]    && called=true && stop
    [ "$1" = "status" ]  && called=true && status
    [ "$1" = "js" ]      && called=true && js
	

    # If no command was triggered
    ! $called && echo "Unknown command: $1
Type 'j_kiosk help' for full commands"
}
