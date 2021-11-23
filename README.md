# GLOBAL MAXIMUM POWER POINT TRACKING OF PHOTOVOLTAIC ARRAY USING GREY WOLF ALGORITHM

## DESCRIPTION

A solar photovoltaic system is modelled and integrated with a DC-DC boost converter with a global maximum power point tracking (MPPT) algorithm for different radiation called the **Grey Wolf Optimization (GWO).**

## MODELLING OF THE PHOTOVOLTAIC SYSTEM 

The PV array used has 3 PV cells connected in series to study the partial shaded conditions (PSCs). A DC-DC boost converter consisting of boost inductor L, diode D, filter capacitor C, and load resistance R is used for the design of MPPT controller. The MPPT unit is placed as closed-loop control in the simulation circuit and Vin and Iin are taken as input to the MPPT unit and duty cycle is obtained as the output.

![PV system](PV_SYSTEM.png)

## GWO ALGORITHM 

Grey Wolf Optimizer is a modern heuristic optimization technique that was first introduced by Mirjalili et al  in 2014. Inspired by the social hierarchy and lifestyle of grey wolves, this technique was modelled mathematically to mimic their behaviour in the area of group hunting to perform optimization for maximum power point tracking.  For various values of duty cycle, the panels detect Vpv and Ipv, where the duty cycles are analogous to grey wolves.

![GWO](GWO_ALGORITHM.png)
