import numpy as np
import pandas as pd

# Set random seed for reproducibility
np.random.seed(0)

# Generate random input data
mean_delay = np.random.rand(1000)  # Values between 0 and 1
number_of_servers = np.random.rand(1000)  # Values between 0 and 1
repair_utilization = np.random.rand(1000)  # Values between 0 and 1

# Create a DataFrame to hold the input data
input_data = pd.DataFrame({
    'Mean delay': mean_delay,
    'Number of servers': number_of_servers,
    'Repair utilization': repair_utilization
})

# Save the DataFrame to a CSV file
input_data.to_csv('/mnt/data/fuzzy_input_data.csv', index=False)

# Display the first few rows of the dataframe
input_data.head()
