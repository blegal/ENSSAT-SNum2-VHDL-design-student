# ENSSAT-SNum2-RISC-V-design
 
To use these scripts you should create and go in a **build** directory in the **fpga** one.

## Nexys-A7 board

To generate the bitstream, in **build** directory you must launch :

```
> vivado -mode batch -nolog -nojournal -source ../scripts/nexys_a7_build.tcl
```

If everything is OK and the board connected, just write :

```
> vivado -mode batch -nolog -nojournal -source ../scripts/nexys_a7_load_.tcl
```

## CMod-A7 board

> TOP MODULE CONFIGURED TO HAVE 2 LEDS !

To generate the bitstream, in **build** directory you must launch :

```bash
> vivado -mode batch -nolog -nojournal -source ../scripts/cmod_a7_build.tcl
```

If everything is OK and the board connected, just write :

```bash
> vivado -mode batch -nolog -nojournal -source ../scripts/cmod_a7_load_.tcl
```
