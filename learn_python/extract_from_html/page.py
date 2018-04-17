__author__ = 'root'

from ASDC_FE_tests.pages.common.page import Page
from ASDC_FE_tests.pages.page_model.decorators import page_function_decorator, page_action_decorator
from .element_map import element_map


# page model
class dummyPage(Page):
    """ this is the dummyPage for ASDC"""

    # page initialization
    def __init__(self, log, driver):
        Page.__init__(self, log, driver)

    # --------------------------------------------------------
    # -                    page actions                      -
    # --------------------------------------------------------

    @page_function_decorator()
    def get_sub_menu_button_vsp_ss_elements(self):
        return self.find_elements(element_map.sub_menu_button_vsp_ss)

    @page_action_decorator()
    def send_sub_menu_button_vsp_ss(self, sub_menu_button_vsp_ss):
        self.send_to_element(element_map.sub_menu_button_vsp_ss, sub_menu_button_vsp_ss)

    @page_function_decorator()
    def get_versions_page_select_version_elements(self):
        return self.find_elements(element_map.versions_page_select_version)

    @page_action_decorator()
    def send_versions_page_select_version(self, versions_page_select_version):
        self.send_to_element(element_map.versions_page_select_version, versions_page_select_version)

    @page_function_decorator()
    def get_main_menu_input_search_elements(self):
        return self.find_elements(element_map.main_menu_input_search)

    @page_action_decorator()
    def send_main_menu_input_search(self, main_menu_input_search):
        self.send_to_element(element_map.main_menu_input_search, main_menu_input_search)

    @page_function_decorator()
    def get_sub_menu_button_home_elements(self):
        return self.find_elements(element_map.sub_menu_button_home)

    @page_action_decorator()
    def send_sub_menu_button_home(self, sub_menu_button_home):
        self.send_to_element(element_map.sub_menu_button_home, sub_menu_button_home)

    @page_function_decorator()
    def get_sub_menu_button_dcae_elements(self):
        return self.find_elements(element_map.sub_menu_button_dcae)

    @page_action_decorator()
    def send_sub_menu_button_dcae(self, sub_menu_button_dcae):
        self.send_to_element(element_map.sub_menu_button_dcae, sub_menu_button_dcae)

    @page_function_decorator()
    def get_owner_elements(self):
        return self.find_elements(element_map.owner)

    @page_action_decorator()
    def send_owner(self, owner):
        self.send_to_element(element_map.owner, owner)

    @page_function_decorator()
    def get_versions_page_manage_permissions_elements(self):
        return self.find_elements(element_map.versions_page_manage_permissions)

    @page_action_decorator()
    def send_versions_page_manage_permissions(self, versions_page_manage_permissions):
        self.send_to_element(element_map.versions_page_manage_permissions, versions_page_manage_permissions)

    @page_function_decorator()
    def get_sub_menu_button_sss_elements(self):
        return self.find_elements(element_map.sub_menu_button_sss)

    @page_action_decorator()
    def send_sub_menu_button_sss(self, sub_menu_button_sss):
        self.send_to_element(element_map.sub_menu_button_sss, sub_menu_button_sss)

    @page_function_decorator()
    def get_versions_page_create_version_elements(self):
        return self.find_elements(element_map.versions_page_create_version)

    @page_action_decorator()
    def send_versions_page_create_version(self, versions_page_create_version):
        self.send_to_element(element_map.versions_page_create_version, versions_page_create_version)

    @page_function_decorator()
    def get_breadcrumbs_button_1_elements(self):
        return self.find_elements(element_map.breadcrumbs_button_1)

    @page_action_decorator()
    def send_breadcrumbs_button_1(self, breadcrumbs_button_1):
        self.send_to_element(element_map.breadcrumbs_button_1, breadcrumbs_button_1)

    @page_function_decorator()
    def get_version_item_row_elements(self):
        return self.find_elements(element_map.version_item_row)

    @page_action_decorator()
    def send_version_item_row(self, version_item_row):
        self.send_to_element(element_map.version_item_row, version_item_row)

    @page_function_decorator()
    def get_sub_menu_button_software_products_elements(self):
        return self.find_elements(element_map.sub_menu_button_software_products)

    @page_action_decorator()
    def send_sub_menu_button_software_products(self, sub_menu_button_software_products):
        self.send_to_element(element_map.sub_menu_button_software_products, sub_menu_button_software_products)

    @page_function_decorator()
    def get_breadcrumbs_button_2_elements(self):
        return self.find_elements(element_map.breadcrumbs_button_2)

    @page_action_decorator()
    def send_breadcrumbs_button_2(self, breadcrumbs_button_2):
        self.send_to_element(element_map.breadcrumbs_button_2, breadcrumbs_button_2)

    @page_function_decorator()
    def get_breadcrumbs_button_3_elements(self):
        return self.find_elements(element_map.breadcrumbs_button_3)

    @page_action_decorator()
    def send_breadcrumbs_button_3(self, breadcrumbs_button_3):
        self.send_to_element(element_map.breadcrumbs_button_3, breadcrumbs_button_3)

    @page_function_decorator()
    def get_breadcrumbs_button_4_elements(self):
        return self.find_elements(element_map.breadcrumbs_button_4)

    @page_action_decorator()
    def send_breadcrumbs_button_4(self, breadcrumbs_button_4):
        self.send_to_element(element_map.breadcrumbs_button_4, breadcrumbs_button_4)

    @page_function_decorator()
    def get_sub_menu_button_versions_page_elements(self):
        return self.find_elements(element_map.sub_menu_button_versions_page)

    @page_action_decorator()
    def send_sub_menu_button_versions_page(self, sub_menu_button_versions_page):
        self.send_to_element(element_map.sub_menu_button_versions_page, sub_menu_button_versions_page)

    @page_function_decorator()
    def get_sub_menu_button_license_model_elements(self):
        return self.find_elements(element_map.sub_menu_button_license_model)

    @page_action_decorator()
    def send_sub_menu_button_license_model(self, sub_menu_button_license_model):
        self.send_to_element(element_map.sub_menu_button_license_model, sub_menu_button_license_model)

    # --------------------------------------------------------
    # -                    page functions                    -
    # --------------------------------------------------------

    @page_function_decorator()
    def page_config(self, metadata):

        if metadata.sub_menu_button_vsp_ss is not None:
            self.send_sub_menu_button_vsp_ss(metadata.sub_menu_button_vsp_ss)

        if metadata.versions_page_select_version is not None:
            self.send_versions_page_select_version(metadata.versions_page_select_version)

        if metadata.main_menu_input_search is not None:
            self.send_main_menu_input_search(metadata.main_menu_input_search)

        if metadata.sub_menu_button_home is not None:
            self.send_sub_menu_button_home(metadata.sub_menu_button_home)

        if metadata.sub_menu_button_dcae is not None:
            self.send_sub_menu_button_dcae(metadata.sub_menu_button_dcae)

        if metadata.owner is not None:
            self.send_owner(metadata.owner)

        if metadata.versions_page_manage_permissions is not None:
            self.send_versions_page_manage_permissions(metadata.versions_page_manage_permissions)

        if metadata.sub_menu_button_sss is not None:
            self.send_sub_menu_button_sss(metadata.sub_menu_button_sss)

        if metadata.versions_page_create_version is not None:
            self.send_versions_page_create_version(metadata.versions_page_create_version)

        if metadata.breadcrumbs_button_1 is not None:
            self.send_breadcrumbs_button_1(metadata.breadcrumbs_button_1)

        if metadata.version_item_row is not None:
            self.send_version_item_row(metadata.version_item_row)

        if metadata.sub_menu_button_software_products is not None:
            self.send_sub_menu_button_software_products(metadata.sub_menu_button_software_products)

        if metadata.breadcrumbs_button_2 is not None:
            self.send_breadcrumbs_button_2(metadata.breadcrumbs_button_2)

        if metadata.breadcrumbs_button_3 is not None:
            self.send_breadcrumbs_button_3(metadata.breadcrumbs_button_3)

        if metadata.breadcrumbs_button_4 is not None:
            self.send_breadcrumbs_button_4(metadata.breadcrumbs_button_4)

        if metadata.sub_menu_button_versions_page is not None:
            self.send_sub_menu_button_versions_page(metadata.sub_menu_button_versions_page)

        if metadata.sub_menu_button_license_model is not None:
            self.send_sub_menu_button_license_model(metadata.sub_menu_button_license_model)

    # --------------------------------------------------------
    # -                    page data                         -
    # --------------------------------------------------------

    class create_metadata:
        def __init__(self):
            self.sub_menu_button_vsp_ss = None
            self.versions_page_select_version = None
            self.main_menu_input_search = None
            self.sub_menu_button_home = None
            self.sub_menu_button_dcae = None
            self.owner = None
            self.versions_page_manage_permissions = None
            self.sub_menu_button_sss = None
            self.versions_page_create_version = None
            self.breadcrumbs_button_1 = None
            self.version_item_row = None
            self.sub_menu_button_software_products = None
            self.breadcrumbs_button_2 = None
            self.breadcrumbs_button_3 = None
            self.breadcrumbs_button_4 = None
            self.sub_menu_button_versions_page = None
            self.sub_menu_button_license_model = None
