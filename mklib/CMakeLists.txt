include_directories(${root_src_dir}UnitText ${root_src_dir}include)
set(ocx_core_src
	../src/OCarray.mm
	../src/OCcachePrivate.mm
	../src/OCcache.mm
	../src/OCcache+3DAcc.mm
	../src/OCdictionary.mm
	../src/OClist.mm
	../src/OCmetaToolOSX.mm
	../src/OCstring.mm
	../src/OCarray.mm
	)

add_library(ocxcr ${ocx_core_src})

target_link_libraries(ocxcr)

set(ocx_str_util_src
	../src/OCstring+Path.mm
	../src/OCstring+ContentUtil.mm
	../src/OCstring+Util.mm
	../src/OCstring+UtilCstyle.mm
	../src/OCstring+UtilOCstyle.mm
)
add_library(ocxsu ${ocx_str_util_src})

target_link_libraries(ocxsu)

set(ocs_printer_src
	../src/OCstring+Printer.mm
	../src/OCarray+Printer.mm
	../src/OClist+Printer.mm
	../src/OCdictionary+Printer.mm
	)
add_library(ocxpr ${ocs_printer_src})

target_link_libraries(ocxpr)

