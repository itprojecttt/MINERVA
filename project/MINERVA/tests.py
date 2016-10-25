from django.test import TestCase
from .models import *


class FineMotorMilestoneTest(TestCase):
    def test_fm_milestone_charfield(self):
        milestone_true = FineMotorMilestone(fm_milestone="lorem ipsum", start=2.00, seven_five=4.00, finish=6.00)
        self.assertIsInstance(milestone_true, FineMotorMilestone)
        milestone_false = FineMotorMilestone(start=2, seven_five=4.00, finish=6.00)
        self.assertNotIsInstance(milestone_false, FineMotorMilestone)
