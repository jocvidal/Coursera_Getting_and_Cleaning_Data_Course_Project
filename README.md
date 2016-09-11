## Getting and Cleaning Data Course Project

#Introduction

This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. What follows first are my notes on the original data. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

#The data

The data have 561 features that are unlabeled and can be found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.

The same holds for the training set.

#The script and the tidy dataset

Before we run the scrip run_analysis.R, we need to 
* download de data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
* the UCI HAR Dataset must be extracted and 
* the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

The code merge the testing and training data to a complete data. Then the labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a comma-delimited file called tidy_data.txt, which can also be found in this repository.

#Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
