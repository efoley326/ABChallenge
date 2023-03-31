<!-- see this project at https://github.com/efoley326/ABChallenge -->
# Data Scrubber
written with Ruby, this CLI tool processes JSON data and returns cleaned data to a new file.

### Usage
• To use this tool you will need to have Ruby installed on your machine.
• After cloning this repo, cd into the project directory.
To run the code on test files manually from your CL:
```
ruby scrub.rb tests/<$directory>/input.json tests/<$directory>/sensitive_fields.txt
```
To run all of the tests consecutively, I've provided a script file. Run:
```
bin/run_tests.sh
```
### Expected Behavior
Running the code creates a new file in the base directory ('scrubbed_data.json'). If the file already exists, the new data will be appended to the file.
When using the script file to run all tests you may open the new file at the base directory to review the collective output.
