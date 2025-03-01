resource "aws_lambda_function" "lambda" {
    function_name = "dev"
    runtime = "python3.12"
    role = "arn:aws:iam::713881824558:role/lambda-admin"
    handler = "lambda_function.lambda_handler"
    timeout = 900
    memory_size = 128
    filename = "lambda_function.zip"
    source_code_hash = filebase64sha256("lambda_function.zip") #Terraform detects changes in the ZIP file and updates Lambda automatically.
#Problem: Terraform may not detect when you update lambda_function.zip. if not used source_code_hash

  
}