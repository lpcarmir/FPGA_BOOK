#
# Created by System Generator     Mon Dec 30 21:55:51 2024
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {HDL Netlist}
    set Project {and_gate_cw}
    set DSPFamily {Spartan6}
    set DSPDevice {xc6slx9}
    set DSPPackage {ftg256}
    set DSPSpeed {-2}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set CreateInterfaceDocument {off}
    set NewXSTParser {1}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{and_gate_cw.vhd} -view All}
        {{and_gate.vhd} -view All}
        {{and_gate_cw.ucf}}
        {{and_gate_cw.xdc}}
        {{C:\Users\lpcarm\Desktop\BOOK\FPGA_BOOK\P34_SysGen\AND_GATE.slx}}
    }
    set TopLevelModule {and_gate_cw}
    set SynthesisConstraintsFile {and_gate_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
