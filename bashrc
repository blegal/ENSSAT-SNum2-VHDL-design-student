source /usr/local/vivado-2023.2/Vivado/2023.2/settings64.sh

# exporting the licenses

export LM_LICENSE_FILE=5280@mentor.cnfm.fr:27000@synopsys.cnfm.fr

# adding modelsim to the path

export PATH=$PATH:/usr/local/ModelSimSE-10.0/modeltech/linux_x86_64

# adding design compiler to the path

export PATH=$PATH:/usr/local/DesignVision-2010.03-SP4/amd64/syn/bin

# adding xilinx vivado to the path

export PATH=$PATH:/usr/local/vivado-2023.2/Vivado/2023.2/bin

# fixing a bug in vivado-2023.2

export XILINX_LOCAL_USER_DATA=no
