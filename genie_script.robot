# Genie Devnet Lab-3c: Execute Genie script with Robot
# ====================================================


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


# Run Genie Verification: Verify_BgpAllNexthopDatabase and save snapshot
execute Verify_BgpAllNexthopDatabase and save snapshot
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# Execute Genie Trigger: TriggerShutNoShutBgp
execute TriggerShutNoShutBgp
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Run Genie Verification: Verify_BgpAllNexthopDatabase and compare to snapshot
execute Verify_BgpAllNexthopDatabase and compare to snapshot
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# For Genie DevNet Labs the number of BGP neighbors is 1
# Perform check to verify that the number of BGP neighbors is 1
verify number of bgp neighbors is 1
    verify count "1" "bgp neighbors" on device "uut"


# Perform negative check to verify that the number of BGP neighbors is 5
verify number of bgp neighbors is 5
    verify count "5" "bgp neighbors" on device "uut"
