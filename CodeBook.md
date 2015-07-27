#Codebook for reviewer

##Viriables

    Main viriables describ as follow:
    *train_datas/test_datas: Raw datas from X_train.txt/X_test.txt.
    *train_labels/test_labels: Raw datas from y_train.txt/y_test.txt.
    *train_subject/test_subject: Raw datas from subject_train.txt/subject_test.txt.
    *features_table: Raw datas from features.txt.
    *labels_table: Raw datas from activity_labels.txt.
    *datas: Merged from train_datas and test_datas with all features.
    *lebels: Merged from train_labels and test_labels.
    *subject: Merged from train_subject and test_subject.
    *filtered_datas: Filtered from datas with only "mean" and "std" features.
    *tidy_datas: Filtered from filtered_datas with only "mean" features.

##Steps

    What I do to clean datas is as follow:
    1. Read all the datas needed from files;
    2. Merge train datas and test datas;
    3. Iterate through all the features, check if the feature match "mean" and "std"(use regex), if not match, drop this feature;
    4. Convert labels to descriptive variable names, use information from activity_labels.txt, then we get the first dataset;
    5. Iterate through the features of filtered_datas, drop features related to "std";
    6. Add subject labels, then we get the second dataset.

    Ps: Label and subject display as the features append to the end.
