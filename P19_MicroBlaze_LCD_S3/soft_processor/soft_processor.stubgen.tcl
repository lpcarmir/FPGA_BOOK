cd C:/Users/lpcarm/Desktop/FPGA_BOOK/P19_soft_Processor_S3/soft_processor/
if { [ catch { xload xmp soft_processor.xmp } result ] } {
  exit 10
}
xset hdl vhdl
run stubgen
exit 0
