from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import unittest


class PythonOrgSearch(unittest.TestCase):
    """A sample test class to show how page object works"""

    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.get("http://www.sababa.nl/hb/")

    def test_search_in_python_org(self):
        """
        Tests python.org search feature. Searches for the word "pycon" then verified that some results show up.
        Note that it does not look for any particular text in search results page. This test verifies that
        the results were not empty.
        """
        b_destination = self.driver.find_element_by_id("b_destination")
        b_checkin_month = self.driver.find_element_by_id("b_checkin_month")
        b_checkin_day = self.driver.find_element_by_id("b_checkin_day")
        idf = self.driver.find_element_by_name("idf")

    def tearDown(self):
        self.driver.close()


if __name__ == "__main__":
    unittest.main()