# health check
import sklearn

# train exercise
from sklearn import tree

# weight & smoothness
features = [[140, 1], [130, 1], [150, 0], [170, 0]]
labels = [0, 0, 1, 1]

clf = tree.DecisionTreeClassifier()
clf = clf.fit(features, labels)
r = clf.predict([[150, 0]])
print(r)


# horsepower & seats
features = [[300, 2], [450, 2], [200, 8], [150, 9]]
labels = ["sports-car", "sports-car", "minivan", "minivan"]

clf = tree.DecisionTreeClassifier()
clf = clf.fit(features, labels)
r = clf.predict([[250, 3]])
print(r)
