proc exportToSDK {} {
  cd C:/Users/lpcarm/Desktop/FPGA_BOOK/P19_soft_Processor_S3/soft_processor
  if { [ catch { xload xmp soft_processor.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

exit $result
