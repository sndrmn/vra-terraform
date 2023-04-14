provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_dynamodb_table" "votting_table" {
  name = "votting_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"
  
  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "table_item_1" {
  table_name = aws_dynamodb_table.votting_table.name
  hash_key = aws_dynamodb_table.votting_table.hash_key

  item = <<ITEM
{
  "id": {"S": "Potato"},
  "Count": {"N": "0"}
}
ITEM
}

resource "aws_dynamodb_table_item" "table_item_2" {
  table_name = aws_dynamodb_table.votting_table.name
  hash_key = aws_dynamodb_table.votting_table.hash_key

  item = <<ITEM
{
  "id": {"S": "LamLam"},
  "Count": {"N": "0"}
}
ITEM
}

resource "aws_dynamodb_table_item" "table_item_3" {
  table_name = aws_dynamodb_table.votting_table.name
  hash_key = aws_dynamodb_table.votting_table.hash_key

  item = <<ITEM
{
  "id": {"S": "Right"},
  "Count": {"N": "0"}
}
ITEM
}