# Genie Devnet Lab-3a: Execute Genie Triggers
# ===========================================


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


# Trigger-1: TriggerShutNoShutBgp
#    1. Connects to UUT device, checks if BGP configuration is present and learns BGP configuration
#    2. Configures 'shutdown' under BGP instance to shutdown BGP
#    3. Verifies BGP instance and BGP neighbors are in 'shutdown' state
#    4. Configures 'no shutdown' under BGP instance
#    5. Verifies BGP instance and BGP neighbors are back up
#
execute TriggerShutNoShutBgp
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Trigger-2: TriggerUnconfigConfigBgp
#    1. Connects to UUT device, checks if BGP configuration is present, learns BGP configuration and creates a checkpoint
#    2. Configures 'no router bgp <instance>' to remove BGP configuration
#    3. Verifies BGP instance and BGP neighbors are removed from configuration
#    4. Restores configuration back to checkpoint stored in Step #1
#    5. Verifies BGP configuration is restored and BGP neighbors are established
#
execute TriggerUnconfigConfigBgp
    run trigger "TriggerUnconfigConfigBgp" on device "uut"
