from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.remote.webelement import WebElement
from selenium.webdriver.common.keys import Keys
# from selenium.webdriver.support.ui import
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import WebDriverException


# driver = webdriver.Firefox(executable_path='C:\\Users\\YehonaDb\\PycharmProjects\\learning\\learn_python\\learn_selenium\\geckodriver.exe')
driver = webdriver.Chrome(executable_path='C:\\Users\\YehonaDb\\PycharmProjects\\learning\\learn_python\\learn_selenium\\chromedriver.exe')
driver.get("http://www.python.org")
assert "Python" in driver.title
elem = driver.find_element_by_name("q")
elem.location
elem.clear()
# elem.send_keys("pycon")
# elem.send_keys(Keys.RETURN)
# assert "No results found." not in driver.page_source

element = driver.find_elements(By.XPATH, '//fieldset[@title="Search Python.org"]')[0]
# element = element.find_element(By.XPATH, './*[@id="submit"]')
class WebDriverWait_Extensions:
    class find_elements(object):
        """ An Expectation for checking if element list exist."""

        def __init__(self, locator):
            self.locator = locator

        def __call__(self, driver):
            try:
                return driver.find_elements(*self.locator)
            except WebDriverException as e:
                raise e

# elements = WebDriverWait(element, 10).until(WebDriverWait_Extensions.find_elements((By.XPATH, './*[@id="submrit"]')))
elements = WebDriverWait(element, 10).until(EC.element_to_be_clickable((By.XPATH, './*[@id="submit"]')))
print(elements)
driver.close()