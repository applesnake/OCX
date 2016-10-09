set(test_OCstring_src
	../test/test_OCstring.mm)

add_executable(test_OCstring ${test_OCstring_src})

target_link_libraries(test_OCstring ocxcr ocxsu)


set(test_OCarray_src
	../test/test_OCarray.mm)

add_executable(test_OCarray ${test_OCarray_src})

target_link_libraries(test_OCarray ocxcr ocxpr)


set(test_OClist_src
	../test/test_OClist.mm)

add_executable(test_OClist ${test_OClist_src})

target_link_libraries(test_OClist ocxcr ocxpr)


set(test_OCdict_src
	../test/test_OCdict.mm)

add_executable(test_OCdict ${test_OCdict_src})

target_link_libraries(test_OCdict ocxcr ocxpr)

set(test_OCcache_src
	../UnitTest/OCXUnitTestObject.mm
	../UnitTest/OCXUT-OCcache-Basic.mm
	../test/test_OCcache.mm)

add_executable(test_OCcache ${test_OCcache_src})


target_link_libraries(test_OCcache ocxcr)

include_directories(${root_src_dir}UnitTest ${root_src_dir}include)

set(test_OCXUnitTestObject_src
	../src/OCmetaToolOSX.mm
	../UnitTest/OCXUnitTestObject.mm
	../test/test_OCXUnitTestObject.mm
)
	
add_executable(test_OCXUnitTestObject ${test_OCXUnitTestObject_src})

target_link_libraries(test_OCXUnitTestObject)

set(test_OCstring2_src
		../UnitTest/OCXUT-OCstring-Basic.mm
		../UnitTest/OCXUnitTestObject.mm
		../test/test_OCstring2.mm)

add_executable(test_OCstring2 ${test_OCstring2_src})

target_link_libraries(test_OCstring2 ocxcr)

set(test_OCstring3_src
		../UnitTest/OCXUnitTestObject.mm
		../UnitTest/OCXUT-OCstring-Util.mm
		../test/test_OCstring3.mm)

add_executable(test_OCstring3 ${test_OCstring3_src})

target_link_libraries(test_OCstring3 ocxcr ocxsu)

set(test_OCstring4_src
		../UnitTest/OCXUnitTestObject.mm
		../UnitTest/OCXUT-OCstring-ContentUtil.mm
		../test/test_OCstring4.mm)

add_executable(test_OCstring4 ${test_OCstring4_src})

target_link_libraries(test_OCstring4 ocxcr ocxsu)

set(test_OCarray2_src
		../UnitTest/OCXUnitTestObject.mm
		../UnitTest/OCXUT-OCarray-Basic.mm
		../test/test_OCarray2.mm)

add_executable(test_OCarray2 ${test_OCarray2_src})

target_link_libraries(test_OCarray2 ocxcr)

set(test_OCstringPath_src
		../UnitTest/OCXUnitTestObject.mm
		../UnitTest/OCXUT-OCstring-Path.mm
		../test/test_OCstringPath.mm)

add_executable(test_OCstringPath ${test_OCstringPath_src})

target_link_libraries(test_OCstringPath ocxcr ocxsu)


