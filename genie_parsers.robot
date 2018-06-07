# Genie Devnet Lab-2: Execute show commands and parse outputs
# ===========================================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     /genie_tests/default_testbed.yaml


*** TestCases ***
# Creating testcases using available Genie, PyATS & Unicon keywords


# Connect to UUT device using CLI
connect to UUT device
    use genie testbed "${testbed}"
    connect to devices "uut"


# Load parser "ShowBgpProcessVrfAll"
# Execute 'show bgp process vrf all'
# Parse the output of the show command using the parser loaded above
execute and parse 'show bgp process vrf all' on UUT
    ${output} = parse "genie.libs.parser.show_bgp.ShowBgpProcessVrfAll" on device "uut"


# Load parser "ShowModule"
# Execute 'show module'
# Parse the output of the show command using the parser loaded above
execute and parse 'show platform' on UUT
    ${output} = parse "genie.libs.parser.show_platform.ShowModule" on device "uut"