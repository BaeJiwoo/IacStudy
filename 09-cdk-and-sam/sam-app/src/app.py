import json


def handler(event, context):
    request_id = getattr(context, "aws_request_id", "local")
    name = (event.get("queryStringParameters") or {}).get("name", "infra-engineer")

    return {
        "statusCode": 200,
        "headers": {"content-type": "application/json"},
        "body": json.dumps({"message": f"hello, {name}", "requestId": request_id}),
    }
