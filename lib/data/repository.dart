Map<String, dynamic> mutation = {
  "status": "ok",
  "messages": "successfully retrieve data",
  "data": {
    "items": [
      {
        "id": "4",
        "date": "2021-10-12",
        "type": "in",
        "value": 100000,
        "information": "topup benings pay"
      },
      {
        "id": "5",
        "date": "2021-10-12",
        "type": "out",
        "value": 1000,
        "information": "beli serum"
      },
      {
        "id": "6",
        "date": "2021-10-12",
        "type": "out",
        "value": 10000,
        "information": "beli serum"
      },
      {
        "id": "7",
        "date": "2021-10-12",
        "type": "out",
        "value": 10000,
        "information": "beli serum"
      }
    ],
    "page": 1,
    "perPage": 10
  }
};

Map<String, dynamic> mutationDetails = {
  "status": "ok",
  "messages": "welcome to my web service",
  "data": {
    "id": "4",
    "username": "anggyjune",
    "date": "2021-10-12",
    "type": "in",
    "value": 100000,
    "information": "topup benings pay",
    "created_at": "2021-10-12 15:28:42",
    "user_created": "anggyjune",
    "updated_at": "0000-00-00 00:00:00",
    "user_updated": ""
  }
};

Map<String, dynamic> topUpWallet = {
  "status": "ok",
  "messages": "successfully added data",
  "data": {
    "value": 100000,
    "information": "topup benings pay",
    "date": "2021-10-12",
    "username": "anggyjune",
    "created_at": "2021-10-12 15:26:12",
    "user_created": "anggyjune"
  }
};

Map<String, dynamic> walletTransaction = {
  "status": "ok",
  "messages": "successfully added data",
  "data": {
    "value": 1000,
    "information": "beli serum",
    "date": "2021-10-12",
    "username": "anggyjune",
    "created_at": "2021-10-12 15:31:47",
    "user_created": "anggyjune",
    "type": "out"
  }
};

Map<String, dynamic> walletBalance = {
  "status": "ok",
  "messages": "welcome to my web service",
  "myBalance": 99000
};

Map<String, dynamic> deleteTransaction = {
  "status": "ok",
  "messages": "successfully deleted data"
};
