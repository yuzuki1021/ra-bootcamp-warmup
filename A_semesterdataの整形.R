##########Semester Dataの整形##########
##1.生データを読み込みなさい (semester_dummy_1.csv, semester_dummy_2.csv)

# semester_dummy_1.csv と semester_dummy_2.csv を読み込む
semester_data_1 <- read.csv("semester_data_1.csv", header = TRUE)
semester_data_2 <- read.csv("semester_data_2.csv", header = TRUE)


##2.semester_dummy_1.csvについては、1行目を列名としなさい

##3.2つのデータを適切に結合しなさい(型に注意)
# データの最初の数行を確認
head(semester_data_1)
head(semester_data_2)
#データ型の確認
str(semester_data_1)
str(semester_data_2)

# データ型の変換
semester_data_1$semester <- as.integer(semester_data_1$semester)
semester_data_1$quarter <- as.integer(semester_data_1$quarter)
semester_data_1$year <- as.integer(semester_data_1$year)
semester_data_1$Y <- as.integer(semester_data_1$Y)

# データの結合
merged_data <- merge(semester_data_1, semester_data_2, by = c("unitid", "semester", "quarter", "year", "Y"), all = TRUE)

# 結果の確認
head(merged_data)

# `unitid` の前後のスペースを削除
semester_data_1$unitid <- trimws(semester_data_1$unitid)
semester_data_2$unitid <- trimws(semester_data_2$unitid)

# `unitid` を文字列型に変換（整数型の場合もあり）
semester_data_1$unitid <- as.character(semester_data_1$unitid)
semester_data_2$unitid <- as.character(semester_data_2$unitid)

# 再度データ型の統一
semester_data_1$semester <- as.integer(semester_data_1$semester)
semester_data_1$quarter <- as.integer(semester_data_1$quarter)
semester_data_1$year <- as.integer(semester_data_1$year)
semester_data_1$Y <- as.integer(semester_data_1$Y)

# データの結合
merged_data <- merge(semester_data_1, semester_data_2, by = c("unitid", "semester", "quarter", "year", "Y"), all = TRUE)

# 結果の確認
head(merged_data)

##4. Y列を削除
semester_data_1 <- semester_data_1[, !names(semester_data_1) %in% "Y"]
semester_data_2 <- semester_data_2[, !names(semester_data_2) %in% "Y"]

##5.semester制導入年を示す列を作成（2001年の場合）
semester_introduction_year <- 2001

# 新しい列を追加
semester_data_1$semester_introduction_year <- semester_introduction_year
semester_data_2$semester_introduction_year <- semester_introduction_year

##6.ダミー変数を作成（2001年導入の場合）
semester_data_1$semester_dummy <- ifelse(semester_data_1$year >= semester_introduction_year, 1, 0)
semester_data_2$semester_dummy <- ifelse(semester_data_2$year >= semester_introduction_year, 1, 0)


