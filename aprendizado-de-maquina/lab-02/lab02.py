
from sklearn.metrics import confusion_matrix
from sklearn.datasets import load_svmlight_file
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
import numpy
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.naive_bayes import GaussianNB
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.linear_model import Perceptron



def print_results(clf, X_test, y_test, y_pred):
	# mostra o resultado do classificador na base de teste
	print ('Accuracy: ', clf.score(X_test, y_test))
	# cria a matriz de confusao
	cm = confusion_matrix(y_test, y_pred)
	print (cm)
	print(classification_report(y_test, y_pred, labels=[0,1,2,3,4,5,6,7,8,9]))


def perceptron(X_train, y_train, X_test, y_test):
	# cria um Perceptron 
	clf = Perceptron()
	print('Fitting Perceptron')
	clf.fit(X_train, y_train) 
	print ('Predicting...')
	y_pred = clf.predict(X_test)
	print_results(clf, X_test, y_test, y_pred)


def linear_discriminant_analysis(X_train, y_train, X_test, y_test):
	# cria um Linear Discriminant Analysis 
	clf = LinearDiscriminantAnalysis()
	print('Fitting Linear Discriminant Analysis')
	clf.fit(X_train, y_train)
	print ('Predicting...')
	y_pred = clf.predict(X_test)
	print_results(clf, X_test, y_test, y_pred)


def logistic_regression(X_train, y_train, X_test, y_test):
	# cria um logistic regression 
	clf = LogisticRegression(max_iter=1000)
	print ('Fitting logistic regression')
	clf.fit(X_train, y_train)
	print ('Predicting...')
	y_pred = clf.predict(X_test)
	print_results(clf, X_test, y_test, y_pred)


def naive_bayes(X_train, y_train, X_test, y_test):
	# cria naive bayes
	gnb = GaussianNB()
	print ('Fitting naive_bayes')
	gnb.fit(X_train, y_train)
	print ('Predicting...')
	y_pred = gnb.predict(X_test)
	print_results(gnb, X_test, y_test, y_pred)


def knn(X_train, y_train, X_test, y_test):
	# cria um kNN
	neigh = KNeighborsClassifier(n_neighbors=3, metric='euclidean')
	print ('Fitting knn')
	neigh.fit(X_train, y_train)
	# predicao do classificador
	print ('Predicting...')
	y_pred = neigh.predict(X_test)
	print_results(neigh, X_test, y_test, y_pred)



if __name__ == "__main__":
	train_lines = []
	
	print ("Loading data...")
	
	# test features, test labels
	X_test, y_test = load_svmlight_file("Dados/test.txt")
	X_test = X_test.toarray()

	step = 1000
	start = 1000
	interval = 20000

	for i in range(start, interval + 1, step):
		# print(i)

		# train features, train labels
		X_train, y_train = load_svmlight_file(f"treino_dividido/train-{i}.txt")
		X_train = X_train.toarray()

		knn(X_train, y_train, X_test, y_test)
			
		naive_bayes(X_train, y_train, X_test, y_test)
		
		logistic_regression(X_train, y_train, X_test, y_test)
		
		linear_discriminant_analysis(X_train, y_train, X_test, y_test)
		
		perceptron(X_train, y_train, X_test, y_test)
