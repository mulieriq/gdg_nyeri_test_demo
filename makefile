# build_runner:
# 	flutter pub run build_runner build --delete-conflicting-outputs
run_test:
	flutter test --coverage	
generage_coverage:	
	genhtml coverage/lcov.info -o coverage/html
open_coverage_results:	
	open coverage/html/index.html
# run:
# 	flutter run  
	



.PHONY: run_test,generage_coverage,open_coverage_results

