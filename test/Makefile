all: test_OCstring_Printer test_OClist test_OCarray

test_OCstring_Printer : test_OCstring.o OCstring.o OCstring+Printer.o
	clang++ -g -ObjC++ -o test_OCstring_Printer test_OCstring.o OCstring.o OCstring+Printer.o -L/usr/lib -lobjc

test_OCarray : test_OCarray.o OCarray.o OCstring.o OCstring+Printer.o OCarray+Printer.o
	clang++ -g -ObjC++ -o test_OCarray test_OCarray.o OCarray+Printer.o OCstring+Printer.o OCarray.o OCstring.o -L/usr/lib -lobjc

test_OClist : test_OClist.o OClist.o OCstring.o OClist+Printer.o OCstring+Printer.o
	clang++ -g -ObjC++ -o test_OClist test_OClist.o OClist+Printer.o OCstring+Printer.o OClist.o OCstring.o -L/usr/lib -lobjc

OCarray.o : ../src/OCarray.mm
	clang++ -g -ObjC++ -std=c++11 -c ../src/OCarray.mm -I../include

OCstring.o : ../src/OCstring.mm
	clang++ -g -ObjC++ -c ../src/OCstring.mm -I../include

OClist.o : ../src/OClist.mm
	clang++ -g -std=c++11 -ObjC++ -Wobjc-method-access -c ../src/OClist.mm -I../include

OCarray+Printer.o : ../src/OCarray+Printer.mm
	clang++ -g -ObjC++ -std=c++11 -c ../src/OCarray+Printer.mm -I../include

OCstring+Printer.o : ../src/OCstring+Printer.mm
	clang++ -g -ObjC++ -c ../src/OCstring+Printer.mm -I../include

OClist+Printer.o : ../src/OClist+Printer.mm
	clang++ -g -std=c++11 -ObjC++ -Wobjc-method-access -c ../src/OClist+Printer.mm -I../include

test_OCstring.o : test_OCstring.mm
	clang++ -g -ObjC++ -c test_OCstring.mm -I../include

test_OClist.o : test_OClist.mm
	clang++ -g -ObjC++ -c test_OClist.mm -I../include

test_OCarray.o : test_OCarray.mm
	clang++ -g -ObjC++ -c test_OCarray.mm -I../include

clear:
	rm *.o