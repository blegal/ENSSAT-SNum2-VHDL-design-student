rm -rf  BODY ARCH dc ENTI obj PACK *.syn *.mr

set target_library [list /usr/local/DesignKit/hcmos9gp_920/CORE9GPLL_SNPS_AVT_4.1/SNPS/common/SYMBOL/CORE9GPLL.sdb	]
set link_library   [list /usr/local/DesignKit/hcmos9gp_920/CORE9GPLL_SNPS_AVT_4.1/SNPS/common/SYMBOL/CORE9GPLL.sdb	]

set hcmos9gp /usr/local/DesignKit/hcmos9gp_920/CORE9GPLL_SNPS_AVT_4.1/SNPS/bc_1.32V_0C_wc_1.08V_105C/PHS/CORE9GPLL_Nom.db 
set search_path    "$search_path"
set target_library "$hcmos9gp"
set link_library   "* $hcmos9gp"
set symbol_library "/usr/local/DesignKit/hcmos9gp_920/CORE9GPLL_SNPS_AVT_4.1/SNPS/common/SYMBOL/CORE9GPLL.sdb"

echo "\n\nSettings:"
echo "search_path:       $search_path"
echo "link_library:      $link_library"
echo "target_library:    $target_library"
echo "symbol_library:    $symbol_library"

analyze -library WORK -format vhdl { ../5-xor-gate-vector/xor_gate_signals.vhd }

#
#	COMPILATION NORMALE
#

elaborate xor_gate_vector -architecture ARCH

#
#
#	COMPILATION ULTRA
