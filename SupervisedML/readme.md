**Overview of [project](https://github.com/Inferno-scorp/DataAnalytics-and-DataScience-Projects/blob/main/SupervisedML/PredictionOfScoresBasedOnStudyHours.ipynb)**


This is an overview of our project which I've done as a part of TheSparksFoundation Internship Programme.                                                           
Here My task was to **predict the percentage of student based on his/her number of study hours from given dataset.**
- In which I've had to find out whether there is any relationship or correlation between both variable or not, later predicting the student's percentage based on his/her study hours.
(Which can be useful for students who are not sure whether longer study hours are responsible for students performance or not and it can also used as an important advice to students by teachers or parents.)

Source of the DataSet: http://bit.ly/w-data
<hr> 


<h5>&nbsp;<h5>
  
  
- **Dataset**
![Dataset](https://github.com/Inferno-scorp/DataAnalytics-and-DataScience-Projects/blob/main/SupervisedML/img/dataset.png)
           - Each row having a similar color is an indication of variables having high correlation  

<h5>&nbsp;<h5>
           
- **Hours/Scores scatter ploy**
![Hours/Scores](https://github.com/Inferno-scorp/DataAnalytics-and-DataScience-Projects/blob/main/SupervisedML/img/scores_hours_Scatter.png)
          - We can see that there is linearity between the two coordinates.which shows if a student studies for longer duration ,he will certainly get better score.               
<h5>&nbsp;<h5>
  

- **Checking if our regressor model working properly or not**
![Regression](https://github.com/Inferno-scorp/DataAnalytics-and-DataScience-Projects/blob/main/SupervisedML/img/TrainTestReg.png)
         - On the Visualization our Train model we have the regression line (which shows the predicted scores) which is very close to points which are actual scores(coral colored points).                                     
and now after visualizing our test model which hasn't been trained yet ,here we can observe that model is still predicting the scores pretty accurate for the newer points also.

Which implies our model is working properly.
  
<h5>&nbsp;<h5>

<h2>Que:What will be the predicted score if a student studies 9.25 Hours per day ?</h2>
Ans: With help of regressor we've got the value of 93.69173248737535.
And Hence,If a student studies 9.25 hours a day, He's predicted score will be 93.69.



