import requests

# замените YOUR_API_KEY на ваш API ключ
API_KEY = 'c9ec5e68c1e841a59ae29be71d052a47'

# параметры запроса к API Spoonacular
def get_search_results(query):
    params = {
        'query': query,
        'apiKey': API_KEY,
        'number': 21,
        'instructionsRequired': True,
        'addRecipeInformation': True
    }

    # URL API для поиска рецептов
    url = 'https://api.spoonacular.com/recipes/search'

    # выполнение запроса
    response = requests.get(url, params=params)

    # обработка ответа
    if response.status_code == 200:
        # преобразование ответа в JSON
        result = response.json()
        return result
    else:
        print('Ошибка выполнения запроса:', response.status_code)
        return response.status_code


def get_product_info(product_id):
    # Ссылка на API Spoonacular
    url = f"https://api.spoonacular.com/food/products/{product_id}"
    
    # Параметры для запроса, включая API ключ и необходимые поля
    params = {
        "apiKey": API_KEY,
        "includeNutrition": True,
        "includeImage": True,
        "addProductInformation": True
    }
    
    # Отправляем GET-запрос
    response = requests.get(url, params=params)
    
    # Если запрос успешен, извлекаем данные из JSON
    if response.status_code == 200:
        data = response.json()
        nutrition_dict = {
            "id": product_id,
            "calories": next((item["amount"] for item in data["nutrition"]["nutrients"] if item["name"] == "Calories"), None),
            "protein": next((item["amount"] for item in data["nutrition"]["nutrients"] if item["name"] == "Protein"), None),
            "fat": next((item["amount"] for item in data["nutrition"]["nutrients"] if item["name"] == "Fat"), None),
            "carbs": next((item["amount"] for item in data["nutrition"]["nutrients"] if item["name"] == "Carbohydrates"), None),
            "title": data["title"],
            "descript": data["description"],
            "image_url": data["images"][0] if data.get("images") else None
        }
        print("From PRODUCT f -> " + str(nutrition_dict))

        return nutrition_dict
    else:
        # Возвращаем None, если запрос не удался
        return None


def split_dict_equally(input_dict):
    # Определяем количество элементов в словаре
    dict_len = len(input_dict)
    # Рассчитываем количество элементов в каждом новом словаре
    split_size = dict_len // 3
    # Разбиваем словарь на три новых словаря
    dict_1 = dict(list(input_dict.items())[:split_size])
    dict_2 = dict(list(input_dict.items())[split_size:2*split_size])
    dict_3 = dict(list(input_dict.items())[2*split_size:])
    return dict_1, dict_2, dict_3
