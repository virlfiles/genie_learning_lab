# Genie Devnet Lab-2: Execute show commands and parse outputs
# ===========================================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, pyATS & Unicon keywords


# Connect to UUT device using CLI
connect to UUT device
    use genie testbed "${testbed}"
    connect to devices "uut"


# Load parser "ShowBgpProcessVrfAll"
# Execute 'show bgp process vrf all'
# Parse the output of the show command using the parser loaded above
execute and parse 'show bgp process vrf all' on UUT
    parse "show bgp process vrf all" on device "uut"


# Load parser "ShowModule"
# Execute 'show module'
# Parse the output of the show command using the parser loaded above
execute and parse 'show platform' on UUT
    parse "show module" on device "uut"
