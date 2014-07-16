library('testthat')

# Load the functions
source('cachematrix.R')

# Run the tests
test_dir('tests', reporter = 'Summary')