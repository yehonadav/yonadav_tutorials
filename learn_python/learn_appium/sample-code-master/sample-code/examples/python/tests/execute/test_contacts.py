# import pytest
# from tests import conftest
# from tests.utils import drivers
# from tests.data.count_functions import from_zero_to_hero
#
#
# def test_add_contacts():
#     driver = drivers.get(conftest.DRIVER_URL, conftest.desired_caps_app1)
#     el = driver.find_element_by_accessibility_id("Add Contact")
#     el.click()
#
#     textfields = driver.find_elements_by_class_name("android.widget.EditText")
#     textfields[0].send_keys("Appium User")
#     textfields[2].send_keys("someone@appium.io")
#     print(driver.page_source)
#     assert 'Appium User' == textfields[0].text
#     assert 'someone@appium.io' == textfields[2].text
#
#     driver.find_element_by_accessibility_id("Save").click()
#
#     # for some reason "save" breaks things
#     alert = driver.switch_to_alert()
#
#     # no way to handle alerts in Android
#     driver.find_element_by_android_uiautomator('new UiSelector().clickable(true)').click()
#
#     driver.press_keycode(3)
#     driver.quit()
#
#
# @pytest.mark.parametrize('test_data',
#     from_zero_to_hero,
#     ids=(lambda test: str(test.id)))
# def test_data_driven(test_data):
#     assert isinstance(test_data, int)
#
#
# def create_tests_params():
#     drivers = ('chrome', 'firefox', 'ie')
#     os = ('windows', 'mac', 'linux')
#     data = [i for i in range(20)]
#
# class TestModel:
#     def __init__(self, driver, data):
#         self.driver = driver
#         self.data = data


def lengthen(length, to):
    if length > to:
        return length - 1
    i = length - 1
    while to > i:
        i += length
    return i - to + length - 1


def test_1(data_lists):

    data_lists = [
        (1,),
        (1,2,3),
        (1,2),
        (1,2,3,4)
    ]

    data_lists.sort(key = len)

    all_possibilities = 1
    for i in range(1, len(data_lists)):
        all_possibilities *= len(data_lists[i])

    data = [[] for _ in range(all_possibilities)]
    print(len(data))
    print(data)

    looper = all_possibilities
    for data_list in data_lists:
        looper /= len(data_list)
        d = 0
        while d < all_possibilities:
            for i in data_list:
                for _ in range(int(looper)):
                    data[d].append(i)
                    d += 1

    for i in data:
        print(i)
    # x = y = 0
    # data = []
    # for i in range(y, len(data_list)):
    #     data.append([])
    #     data[-1].append(data_list[i][x])
    # y += 1
    #
    # print(data_list[y][b+x])
    # print(i)