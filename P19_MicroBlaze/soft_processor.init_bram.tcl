cd C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor
if { [ catch { xload xmp soft_processor.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
