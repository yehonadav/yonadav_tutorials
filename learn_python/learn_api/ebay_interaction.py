# from ebaysdk.finding import Connection as finding
# from bs4 import BeautifulSoup
# import time
#
# keywords = input('Enter your keywords/s (ex: white piano):\n')
#
# t = time.time()
#
# api = finding(appid='yonadavb-yonadavk-PRD-d5d7a0307-d6e6c442', config_file=None)
# api_request = {'keywords': keywords, 'outputSelector': 'SellerInfo'}
#
# response = api.execute('findItemsByKeywords', api_request)
# soup = BeautifulSoup(response.content, 'lxml')
#
# totalentries = int(soup.find('totalentries').text)
# items = soup.find_all('item')
#
# input(items[0])
#
# print(time.time()-t)




# from ebaysdk.finding import Connection as finding
# from ebaysdk.exception import ConnectionError
#
# try:
#     api = finding(domain='svcs.sandbox.ebay.com', debug=True, config_file='myebay.yaml')
#     api_request = {
#             'Keywords':'Harry Potter',
#             'MaxEntries': 2,
#             'AvailableItemsOnly':True,
#     }
#
#     response = api.execute('findItemsAdvanced', api_request)
#     print(response)
#
# except ConnectionError as e:
#     print("\n\n\n",e)
#     print("\n\n\n",e.response.dict())




from ebaysdk.finding import Connection as finding

api = finding(siteid='EBAY-GB', appid='yonadavb-yonadavk-PRD-d5d7a0307-d6e6c442', config_file=None)

api.execute('findItemsAdvanced', {
    'keywords': 'laptop',
    'categoryId' : ['177', '111422'],
    'itemFilter': [
        {'name': 'Condition', 'value': 'Used'},
        {'name': 'MinPrice', 'value': '200', 'paramName': 'Currency', 'paramValue': 'GBP'},
        {'name': 'MaxPrice', 'value': '400', 'paramName': 'Currency', 'paramValue': 'GBP'}
    ],
    'paginationInput': {
        'entriesPerPage': '25',
        'pageNumber': '1'
    },
    'sortOrder': 'CurrentPriceHighest'
})

dictstr = api.response_dict()

for item in dictstr['searchResult']['item']:
    print("ItemID: %s" % item['itemId'].value)
    print("Title: %s" % item['title'].value)
    print("CategoryID: %s" % item['primaryCategory']['categoryId'].value)