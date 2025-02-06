proc exportToSDK {} {
  cd C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor
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

set sExportDir [ xget sdk_export_dir ]
set sExportDir [ file join "C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor" "$sExportDir" "hw" ] 
if { [ file exists C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor_top.bit ] } {
   puts "Copying bit file C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor_top.bit to $sExportDir" 
   file copy -force "C:/Users/lpcarm/Desktop/FPGA_BOOK/P18_MicroBlaze/soft_processor_top.bit" $sExportDir
}
exit $result
