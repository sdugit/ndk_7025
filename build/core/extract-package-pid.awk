# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Extract the pid of a given package name. This assumes that the
# input is the product of 'adb shell ps' and that the PACKAGE variable
# has been initialized to the package's name. In other words, this should
# be used as:
#
#   adb shell ps | awk -f <this-script> -v PACKAGE=<name>
#
# The printed value will be 0 if the package is not found.
#

BEGIN {
    PID=0
    FS=" "
}

# We use the fact that the 9th column of the 'ps' output
# contains the package name, while the 2nd one contains the pid
#
$9 == PACKAGE {
    PID=$2
}

END {
    print PID
}