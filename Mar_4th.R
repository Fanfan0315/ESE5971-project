df = read.csv("Telco_Customer_Churn.csv", stringsAsFactors = FALSE)

head(df)
dim(df)

boxplot(df$Total.Charges, main="Boxplot of Total Charges", ylab="Charges")

df$Total.Charges_log <- log(df$Total.Charges + 1)

# ==========================================
# Find Outliers
# ==========================================

# 1. Compute Q1 (25%) & Q3 (75%)
Q1 = quantile(df$Total.Charges, 0.25, na.rm = TRUE)
Q3 = quantile(df$Total.Charges, 0.75, na.rm = TRUE)

# 2. Compute IQR
IQR_value = Q3 - Q1

# 3. Lower and upper bound
lower_bound = Q1 - 1.5 * IQR_value
upper_bound = Q3 + 1.5 * IQR_value

# 4. Extract outliers
outliers_TotalCharges = df$Total.Charges[df$Total.Charges < lower_bound | df$Total.Charges > upper_bound]

# 5. Print the count
print(paste("Total.Charges outlier count:", length(outliers_TotalCharges)))

missing_data = df[is.na(df$Total.Charges), ]
View(missing_data)

real_outliers = outliers_TotalCharges[!is.na(outliers_TotalCharges)]
print(paste("Real Total.Charges outliers:", length(real_outliers)))