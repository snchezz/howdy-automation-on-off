#!/bin/bash

# Andrés Sánchez   
# https://github.com/snchezz/

# Metemos en una variable el estado de la batería, este puede ser discharging (descargando, es decir
# que no esta cargando) o charging (es decir que esta cargando)
estadobateria=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep state | awk '{print $2}')

# Con un bucle if comparamos la variable con la palabra discharging, si esta descargandose, howdy de 
# desactivara para ahorrar batería. Si esta cargando, es decir la variable no es discharging, se activara.

if [[ $estadobateria == discharging ]]; then
    # echo $estadobateria
    # echo "Descargando"
    sudo howdy disable 1
else
    # echo $estadobateria
    # echo "Cargando"
    sudo howdy disable 0
fi
