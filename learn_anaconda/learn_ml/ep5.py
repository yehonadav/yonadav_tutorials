from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from scipy.spatial import distance
import random


def euc(a, b):
    return distance.euclidean(a, b)


# random classifier
class ScrappyRandom:
    def fit(self, x_train, y_train):
        self.x_train = x_train
        self.y_train = y_train

    def predict(self, x_test):
        predictions = []
        for _ in x_test:
            label = random.choice(self.y_train)
            predictions.append(label)
        return predictions


class ScrappyKNN:
    def fit(self, x_train, y_train):
        self.x_train = x_train
        self.y_train = y_train

    def predict(self, x_Test):
        predictions = []
        for row in x_test:
            label = self.closest(row)
            predictions.append(label)
        return predictions

    def closest(self, row):
        best_dist = euc(row, self.x_train[0])
        best_index = 0
        for i in range(1, len(self.x_train)):
            dist = euc(row, self.x_train[i])
            if dist < best_dist:
                best_dist = dist
                best_index = i
        return self.y_train[best_index]

iris = datasets.load_iris()

x = iris.data
y = iris.target

x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=.5)


my_classifier = ScrappyRandom()
my_classifier.fit(x_train, y_train)

predictions = my_classifier.predict(x_test)
print(accuracy_score(y_test, predictions))


my_classifier = ScrappyKNN()
my_classifier.fit(x_train, y_train)

predictions = my_classifier.predict(x_test)
print(accuracy_score(y_test, predictions))