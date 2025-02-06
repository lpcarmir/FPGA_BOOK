proc pnsynth {} {
  cd C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor
  if { [ catch { xload xmp soft_processor.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
