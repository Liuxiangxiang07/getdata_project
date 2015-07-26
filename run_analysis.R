#read datas required
train_datas = read.table("UCI HAR Dataset/train/X_train.txt")
train_labels = read.table("UCI HAR Dataset/train/y_train.txt")
train_subject = read.table("UCI HAR Dataset/train/subject_train.txt")

test_datas = read.table("UCI HAR Dataset/test/X_test.txt")
test_labels = read.table("UCI HAR Dataset/test/y_test.txt")
test_subject = read.table("UCI HAR Dataset/test/subject_test.txt")

features_table = read.table("UCI HAR Dataset/features.txt")
labels_table = read.table("UCI HAR Dataset/activity_labels.txt")

#merge datas
datas = rbind(train_datas, test_datas)
lebels = rbind(train_labels, test_labels)
subject = rbind(train_subject, test_subject)

#filter required feature(mean and std)
filtered_datas = data.frame()
header = c()
for(feature_index in c(1:length(features_table$V2)) ){
    feature_name = as.character(features_table[feature_index, 2])
    if(grepl("(mean)|(std)", feature_name)){
        if(length(filtered_datas) == 0){
            filtered_datas = data.frame(feature_name = datas[, feature_index])
        }else{
            filtered_datas[[feature_name]] = datas[, feature_index]
        }
        header = cbind(header, feature_name)
    }
}

for(i in c(1:length(lebels[,1])) ){
    lebels[i,1] = as.character(labels_table[lebels[i,1], 2])
}
filtered_datas$label = lebels[,1]

#write filted datas to file
write.table(filtered_datas, "dataset.txt", row.names = FALSE)

#generate tidy datas
tidy_datas = data.frame(filtered_datas)
column_names = colnames(tidy_datas)
for( name in column_names ){
    if(!grepl("(mean)|(label)", name)){
        tidy_datas[[name]] = NULL
    }
}
tidy_datas$subject = subject[,1]

#write tidy datas to file
write.table(tidy_datas, "tidy_dataset.txt", row.names = FALSE)
