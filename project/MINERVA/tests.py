from django.test import TestCase
from django.db import transaction
from .models import *


class FineMotorMilestoneTest(TestCase):

    @transaction.atomic()
    def test_fm_milestone_charfield(self):
        with transaction.atomic():
            # Test correct input (Integrity error happens because of only the milestone is the input.)
            with self.assertRaises(django.db.utils.IntegrityError):
                FineMotorMilestone.objects.create(fm_milestone="lorem ipsum")

        with transaction.atomic():
            # Test False input
            with self.assertRaises(django.db.utils.DataError):
                FineMotorMilestone.objects.create(fm_milestone="lorem ipsum lorem ipsum lorem ipsum lorem ipsum "
                                                               "lorem ipsum")
                FineMotorMilestone.objects.create(fm_milestone=123)
                FineMotorMilestone.objects.create(fm_milestone="!@#$%^&*")

    @transaction.atomic()
    def test_milestone_start_field(self):
        with transaction.atomic():
            # Test correct input (Integrity error happens because of only the milestone is the input.)
            with self.assertRaises(django.db.utils.IntegrityError):
                FineMotorMilestone.objects.create(start=2.00)

        with transaction.atomic():
            # Test False input
            with self.assertRaises(django.core.exceptions.ValidationError):
                FineMotorMilestone.objects.create(start="lorem ipsum")
                FineMotorMilestone.objects.create(start=123)
                FineMotorMilestone.objects.create(start="!@#$%^&*")
                FineMotorMilestone.objects.create(start=5.4321)

    @transaction.atomic()
    def test_milestone_seven_five_field(self):
        with transaction.atomic():
            # Test correct input (Integrity error happens because of only the milestone is the input.)
            with self.assertRaises(django.db.utils.IntegrityError):
                FineMotorMilestone.objects.create(seven_five=4.00)

        with transaction.atomic():
            # Test False input
            with self.assertRaises(django.core.exceptions.ValidationError):
                FineMotorMilestone.objects.create(seven_five="lorem ipsum")
                FineMotorMilestone.objects.create(seven_five=123)
                FineMotorMilestone.objects.create(seven_five="!@#$%^&*")
                FineMotorMilestone.objects.create(seven_five=5.4321)

    @transaction.atomic()
    def test_milestone_finish_field(self):
        with transaction.atomic():
            # Test correct input (Integrity error happens because of only the milestone is the input.)
            with self.assertRaises(django.db.utils.IntegrityError):
                FineMotorMilestone.objects.create(finish=7.00)

        with transaction.atomic():
            # Test False input
            with self.assertRaises(django.core.exceptions.ValidationError):
                FineMotorMilestone.objects.create(finish="lorem ipsum")
                FineMotorMilestone.objects.create(finish=123)
                FineMotorMilestone.objects.create(finish="!@#$%^&*")
                FineMotorMilestone.objects.create(finish=5.4321)

    @transaction.atomic()
    def test_milestone_return_field(self):
        with transaction.atomic():
            # Test correct input
            test = FineMotorMilestone(fm_milestone="lorem ipsum")
            self.assertEqual(str(test), "lorem ipsum")
        #
        # with transaction.atomic():
        #     # Test False input
        #     with self.assertRaises(django.core.exceptions.ValidationError):
        #         self.assertNotEqual(str(FineMotorMilestone.objects.create(fm_milestone=123)), 123)



