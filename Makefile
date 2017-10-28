all: test
test:
	swipl -l tests/tests.pl -g run_tests,halt



