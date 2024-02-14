default:
	cmake -B build --warn-uninitialized
	cmake --build build

eaggr:
	cmake -B build --warn-uninitialized
	cmake --build build --target eaggr

test_harness:
	cmake -B build --warn-uninitialized
	cmake --build build --target eaggr_test_harness

run_tests:
	cd build/EAGGRTestHarness && ./eaggr_test_harness

clean:
	rm -rf build
