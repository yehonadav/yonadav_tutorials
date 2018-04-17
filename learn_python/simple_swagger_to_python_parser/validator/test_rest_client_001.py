import random

from products.asdc.models.be.api_sdc.calls.vendor_license_models import VendorLicenseModelsCalls


class TestRestClient001(object):

    def run(self):
        json_replacement_values = {
            "description": "This is a VLM created by test 001",
            "iconRef": "iconref_001",
            "vendorName": "Shlomi_VLM_"+random.randint(1000,9999).__str__()
        }
        response = VendorLicenseModelsCalls.get_list_vendor_license_models()
        response = VendorLicenseModelsCalls.post_create_vendor_license_model(json_replacement_values)
        pass






if __name__ == "__main__":
    test = TestRestClient001()
    test.run()