import json

def hello_world(event, context):

    print("Got an event\n" + json.dumps(event, indent=2))

    name = event['pathParameters']['name']


    return {
            'statusCode': 200,
            'body': json.dumps('Hello {}!'.format(name))
        }