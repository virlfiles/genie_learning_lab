# Genie Devnet Lab-4: Execute Genie script with Robot
# ===================================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     /genie_tests/default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, PyATS & Unicon keywords


# Connect to UUT device using CLI
connect to UUT device
    use genie testbed "${testbed}"
    connect to devices "uut"


# Execute 'show bgp all neighbors' before executing the trigger
verify Bgp neighbors before trigger
    run verification "Verify_BgpAllNeighbors" on device "uut"


# Execute TriggerClearBgpNeighbor
execute TriggerClearBgpNeighbor
    run trigger "TriggerClearBgpNeighbor" on device "uut" using alias "cli"


# Execute 'show bgp all neighbors' after executing the trigger
verify Bgp neighbors before trigger
    run verification "Verify_BgpAllNeighbors" on device "uut"