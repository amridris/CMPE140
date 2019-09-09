#Clock
    set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports {clk_100MHZ}]; 
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk_100MHZ}];
#switches
    #n
        set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {n[0]}];
        set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {n[1]}];
        set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {n[2]}];
        set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {n[3]}];

    #Buttons
        set_property -dict {PACKAGE_PIN P18  IOSTANDARD LVCMOS33} [get_ports {go}];
        set_property -dict {PACKAGE_PIN M18  IOSTANDARD LVCMOS33} [get_ports {main_clk}];


#LEDs
        set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {led_out[0]}];
        set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {led_out[1]}];
        set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {led_out[2]}]; 
        set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {led_out[3]}]; 
        set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {led_out[4]}]; 
        set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {led_out[5]}];
        set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {led_out[6]}];
        set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {led_out[7]}]; 
        
        set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {led_sel[0]}];
        set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {led_sel[1]}];
        set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {led_sel[2]}];
        set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {led_sel[3]}];
        set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {led_sel[4]}];
        set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {led_sel[5]}];
        set_property -dict {PACKAGE_PIN K2  IOSTANDARD LVCMOS33} [get_ports {led_sel[6]}];
        set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {led_sel[7]}];
        
        #inputs
            set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {n_out[0]}];
            set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {n_out[1]}];
            set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {n_out[2]}];
            set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {n_out[3]}];
        
        #Done and Error
            #green
            set_property -dict {PACKAGE_PIN R11 IOSTANDARD LVCMOS33} [get_ports {done}];
            #red  
            set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {error}];  