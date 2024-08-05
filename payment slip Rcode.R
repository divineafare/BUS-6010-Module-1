# Load necessary packages
library(data.table)
library(dplyr)

# Step 1 & 2: Create a list of workers dynamically
set.seed(123)  # Set seed for reproducibility
n_workers <- 400
workers <- data.frame(
  id = 1:n_workers,
  name = paste("Worker", 1:n_workers, sep = "_"),
  gender = sample(c("Male", "Female"), n_workers, replace = TRUE),
  salary = runif(n_workers, 5000, 30000)
)

# Step 3 & 4: Generate payment slips and determine Employee level
workers <- workers %>%
  mutate(level = case_when(
    salary > 10000 & salary < 20000 ~ "A1",
    salary > 7500 & salary < 30000 & gender == "Female" ~ "A5-F",
    TRUE ~ "B"
  ))

# Step 5: Save the payment slips to a CSV file
write.csv(workers, "payment_slips_r.csv", row.names = FALSE)

print("Payment slips generated successfully!")
