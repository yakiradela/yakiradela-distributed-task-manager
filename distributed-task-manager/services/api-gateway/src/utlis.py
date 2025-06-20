import requests

def forward_request(method, url, data=None, headers=None):
    try:
        response = requests.request(method, url, json=data, headers=headers)
        return response
    except requests.RequestException as e:
        return type("Response", (), {"json": lambda: {"error": str(e)}, "status_code": 500})()
