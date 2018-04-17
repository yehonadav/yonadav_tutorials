from bs4 import BeautifulSoup

with open("SDC.html", 'r') as html_file:
    html_doc = html_file.read()

soup = BeautifulSoup(html_doc, 'html.parser')

# print(soup.name)
# print(soup.title)
# print(soup.prettify())
# print(dir(inputs[0]))

"""
['HTML_FORMATTERS', 'XML_FORMATTERS', '__bool__', '__call__', '__class__', '__contains__', '__copy__', '__delattr__', '__delitem__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattr__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', '__unicode__', '__weakref__', '_all_strings', '_attr_value_as_string', '_attribute_checker', '_find_all', '_find_one', '_formatter_for_name', '_is_xml', '_lastRecursiveChild', '_last_descendant', '_select_debug', '_selector_combinators', '_should_pretty_print', '_tag_name_matches_and', 'append', 'attribselect_re', 'attrs', 'can_be_empty_element', 'childGenerator', 'children', 'clear', 'contents', 'decode', 'decode_contents', 'decompose', 'descendants', 'encode', 'encode_contents', 'extract', 'fetchNextSiblings', 'fetchParents', 'fetchPrevious', 'fetchPreviousSiblings', 'find', 'findAll', 'findAllNext', 'findAllPrevious', 'findChild', 'findChildren', 'findNext', 'findNextSibling', 'findNextSiblings', 'findParent', 'findParents', 'findPrevious', 'findPreviousSibling', 'findPreviousSiblings', 'find_all', 'find_all_next', 'find_all_previous', 'find_next', 'find_next_sibling', 'find_next_siblings', 'find_parent', 'find_parents', 'find_previous', 'find_previous_sibling', 'find_previous_siblings', 'format_string', 'get', 'getText', 'get_attribute_list', 'get_text', 'has_attr', 'has_key', 'hidden', 'index', 'insert', 'insert_after', 'insert_before', 'isSelfClosing', 'is_empty_element', 'known_xml', 'name', 'namespace', 'next', 'nextGenerator', 'nextSibling', 'nextSiblingGenerator', 'next_element', 'next_elements', 'next_sibling', 'next_siblings', 'parent', 'parentGenerator', 'parents', 'parserClass', 'parser_class', 'prefix', 'preserve_whitespace_tags', 'prettify', 'previous', 'previousGenerator', 'previousSibling', 'previousSiblingGenerator', 'previous_element', 'previous_elements', 'previous_sibling', 'previous_siblings', 'quoted_colon', 'recursiveChildGenerator', 'renderContents', 'replaceWith', 'replaceWithChildren', 'replace_with', 'replace_with_children', 'select', 'select_one', 'setup', 'string', 'strings', 'stripped_strings', 'tag_name_re', 'text', 'unwrap', 'wrap']
"""

attributes = ("data-tests-id", "data-test-id", "id")


def get_element_by_attribute(element, attribute):
    if element.has_attr(attribute):
        return element.get_attribute_list(attribute)[0]


def get_filtered_elements_by_attribute(all_elements, attributes):
    results = []
    for element in all_elements:
        for attribute in attributes:
            r = get_element_by_attribute(element, attribute)
            if r is not None:
                results.append(r)
                break
    return results


all_inputs = soup.find_all("input")
inputs = get_filtered_elements_by_attribute(all_inputs, attributes)
for input in inputs:
    print(input)