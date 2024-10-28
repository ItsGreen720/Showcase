# -*- coding: utf-8 -*-
"""excersise 1.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1S484ftLs581jkF0MDGwDHT9PPFbA8eDe
"""

Step 1:

Read csv file

37699839
import pandas as pd
df = pd.read_csv('CreditData.csv')
df


Step 2:

Before splitting the data and implementing a Decision Tree classfifier, we have to convert the column from obj to category and represent its value to numerical one

37699861
df['Status'] = df['Status'].astype('category').cat.codes
df['history'] = df['history'].astype('category').cat.codes
df['Purpose'] = df['Purpose'].astype('category').cat.codes
df['Savings'] = df['Savings'].astype('category').cat.codes
df['employment'] = df['employment'].astype('category').cat.codes
df['sex'] = df['sex'].astype('category').cat.codes
df['guarantors'] = df['guarantors'].astype('category').cat.codes
df['Property'] = df['Property'].astype('category').cat.codes
df['OtherInstallment'] = df['OtherInstallment'].astype('category').cat.codes
df['Housing'] = df['Housing'].astype('category').cat.codes
df['Job'] = df['Job'].astype('category').cat.codes
df['Telephone'] = df['Telephone'].astype('category').cat.codes
df['foreign'] = df['foreign'].astype('category').cat.codes


Step 3:

Split the dataset to 20% training and 80% testing

37699877
from sklearn.model_selection import train_test_split
#Features
X = df.drop('Approved', axis = 1)

#target
y = df.Approved

#split the dataset to 20% testing and 80 training
X_train, X_test, y_train, y_test =  train_test_split(X,y,test_size=0.20, random_state=42)


Step 4:

Implement Decision Tree Classifier by creating the model, training the model using the train set and predict the test data using the trained model

37699894
from sklearn.tree import DecisionTreeClassifier

#create a model
decision_model = DecisionTreeClassifier()

#train the model
decision_model.fit(X_train, y_train)
#predict the test data using the trained model
prediction = decision_model.predict(X_test)
#model evaluation
from sklearn.metrics import confusion_matrix

matrix = confusion_matrix(y_test, prediction)
print(matrix)