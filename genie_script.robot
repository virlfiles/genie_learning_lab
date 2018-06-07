# Genie Devnet Lab-4: Execute Genie script with Robot
# ===================================================


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


# Run Genie Verification: Verify_BgpAllNexthopDatabase before Trigger
execute Verify_BgpAllNexthopDatabase before trigger
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# Execute Genie Trigger: TriggerShutNoShutBgp
execute TriggerShutNoShutBgp
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Run Genie Verification: Verify_BgpAllNexthopDatabase after Trigger
execute Verify_BgpAllNexthopDatabase after trigger
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# Perform Checks: Verify number of BGP neighbors after trigger is the same as that before the trigger
verify number of bgp neighbors
    verify count "1" "bgp neighbors" on device "uut"