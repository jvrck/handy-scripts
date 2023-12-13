#######
## This python script find a certain string value in all ssm parameters in an account
#######

import boto3

# Function to list parameters by a desired value
def list_parameters_by_value(desired_value, ssm_client):
    # Create a paginator for the 'describe_parameters' operation
    paginator = ssm_client.get_paginator('describe_parameters')
    # Initialize an empty list to store matching parameters
    matching_parameters = []

    # Iterate over each page returned by the paginator
    for page in paginator.paginate():
        # Iterate over each parameter in the current page
        for param in page['Parameters']:
            # Fetch the value of the parameter, decrypting it if necessary
            value = ssm_client.get_parameter(Name=param['Name'], WithDecryption=True)['Parameter']['Value']
            print("Checking parameter: " + param['Name'])

            # Check if the value matches the desired value
            if value == desired_value:
                # If it does, append the parameter's name to the list of matching parameters
                matching_parameters.append(param['Name'])

    # Return the list of matching parameters
    return matching_parameters

# Main function
def main():
    # Define the desired value
    ####### UPDATE THIS VALUE #######
    ####### THE VALUE YOURE LOOKING FOR #######
    desired_value = 'value'
    # Create a client for the AWS Systems Manager (SSM)
    ssm_client = boto3.client('ssm')

    # Get the list of parameters that match the desired value
    matching_parameters = list_parameters_by_value(desired_value, ssm_client)
    print("Matching Parameters:")
    # Print each matching parameter
    for param in matching_parameters:
        print(param)

# If this script is the main module, run the main function
if __name__ == "__main__":
    main()
    print("Done!")
