'''
Sample Genie Job File
'''

# Author
__author__ = 'Cisco Systems Inc.'
__copyright__ = 'Copyright (c) 2019, Cisco Systems Inc.'
__contact__ = ['asg-genie-support@cisco.com']
__date__= 'January 2019'


# ATS & Genie
from ats.datastructures.logic import And, Not, Or
from genie.harness.main import gRun


def main(runtime):

    gRun(mapping_datafile='mapping_datafile.yaml',
         trigger_uids=And('TriggerDisableEnableBgp\.'),
         verification_uids=And('Verify_BgpAllNexthopDatabase\.'),
	)
