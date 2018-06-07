# Genie Devnet Lab-3b: Execute Genie Verifications
# ================================================


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
#    1. Connect to the device and execute 'show bgp all nexthop database'
#	 2. Create Python datastructure to save parsed output of show command (pre trigger snapshot)
#
execute Verify_BgpAllNexthopDatabase before trigger
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# Execute Genie Trigger: TriggerShutNoShutBgp
#    1. Connects to UUT device and learns BGP configuration
#    2. Configures 'shutdown' under BGP instance to shutdown BGP
#    3. Verifies BGP instance and BGP neighbors are in 'shutdown' state
#    4. Configures 'no shutdown' under BGP instance
#    5. Verifies BGP instance and BGP neighbors are back up
#
execute TriggerShutNoShutBgp
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Run Genie Verification: Verify_BgpAllNexthopDatabase after Trigger
#    1. Connect to the device and execute 'show bgp all nexthop database'
#	 2. Create Python datastructure to save parsed output of show command (post trigger snapshot)
#
execute Verify_BgpAllNexthopDatabase after trigger
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# Perform Checks: Verify number of BGP neighbors after trigger is the same as that before the trigger
verify number of bgp neighbors
    verify count "6" "bgp neighbors" on device "uut"