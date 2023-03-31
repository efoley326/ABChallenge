#!/bin/bash
cd ~/ABChallenge

ruby scrub.rb tests/00_basic/input.json tests/00_basic/sensitive_fields.txt
ruby scrub.rb tests/01_alphanumeric/input.json tests/01_alphanumeric/sensitive_fields.txt
ruby scrub.rb tests/02_array/input.json tests/02_array/sensitive_fields.txt
ruby scrub.rb tests/03_booleans/input.json tests/03_booleans/sensitive_fields.txt
ruby scrub.rb tests/04_numbers/input.json tests/04_numbers/sensitive_fields.txt
ruby scrub.rb tests/05_floats/input.json tests/05_floats/sensitive_fields.txt
ruby scrub.rb tests/06_nested_object/input.json tests/06_nested_object/sensitive_fields.txt
ruby scrub.rb tests/07_mixed_type_arrays/input.json tests/07_mixed_type_arrays/sensitive_fields.txt
ruby scrub.rb tests/08_sensitive_nested_objects/input.json tests/08_sensitive_nested_objects/sensitive_fields.txt
ruby scrub.rb tests/09_sensitive_nested_arrays/input.json tests/09_sensitive_nested_arrays/sensitive_fields.txt
