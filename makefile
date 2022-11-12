build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs
run_test:
	flutter test --coverage	
generage_coverage:	
	genhtml coverage/lcov.info -o coverage/html
open_coverage_results:	
	open coverage/html/index.html
gpg:
	 export GPG_TTY=$(tty)    
blind_to:
	lcov --remove coverage/lcov.info 'lib/*/*.part.dart' 'lib/*/*.g.dart' 'lib/models/*/*.dart' 'lib/*/url_launcher_service.dart'  'lib/*/*.gr.dart' 'lib/generated_plugin_registrant.dart' -o coverage/lcov.info	 

test_code:
	make run_test && make generage_coverage && make open_coverage_results  
run:
	flutter run  
	
.PHONY: run_test,generage_coverage,open_coverage_results,gpg,test_code