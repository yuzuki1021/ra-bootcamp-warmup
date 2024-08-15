###################(c) Covariates Dataの整形###################
##1.生データを読み込みなさい (covariates.xlsx)
covariates_data <- read.csv("covariates.csv")

##2.’university_id’という列名を’unitid’に変更しなさい
# 必要なパッケージをインストール
install.packages("tidyverse")
# パッケージを読み込み
library(tidyverse)
# 列名の変更
covariates_data <- covariates_data %>%
  rename(unitid = university_id)

##3.’unitid’に含まれる”aaaa”という文字を削除しなさいヒント：stringr
# 必要なパッケージの読み込み
library(stringr)
# 'aaaa' を削除
covariates_data$unitid <- str_remove(covariates_data$unitid, "aaaa")

##4.‘category’列に含まれる’instatetuition’, ‘costs’, ’faculty’, ’white_cohortsize’を別の列として追加しなさい(wide型に変更しなさい)ヒント：pivot_wider
# ワイド形式に変換
covariates_data_wide <- covariates_data %>%
  pivot_wider(names_from = category, values_from = value, values_fill = NA)


##5.outcomeやsemester_dummyに含まれる年を調べ、covariatesデータの期間を他のデータに揃えなさい


##6.outcome_dataに含まれるunitidを特定し、covariatesに含まれるunitidをoutcomeデータに揃えなさい



###################(d) Master Dataの作成###################
##結合に用いる変数を考え、semester_data, covariates_data, gradrate_dataを適切に結合しなさいヒント：left_join