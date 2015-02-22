1) Merging both data sets: x_test and x_train, into one d_final_set
Also, doing the same for y_test and y_train: to create one cummulative data set. 

variables are d_final_<set/subject/y>

2)  f is the file with "features.txt", but as we need only std and mean, I subset only those rows where there 

are "mean" and "std" entries are made. for this, I create vector s which has numbers of rows with "std" and 

"mean". 

3) form d_tidy from d_final_set, extracting only columns which correspond to those variables from step2, and 

applying descriptive names from f 

4) merging d_tidy with subjects and with activities 

5) replacing Activities numbers with Activities names

6) forming tidy from d_tidy by aggregation of each variable , for each combination of Activity & Subject

7) writting to txt.file
