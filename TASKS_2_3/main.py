import pprint

# Задача №1:

cook_book = {}
ingredients_list = []
ORIGINAL = "recipes.txt"
EDITED = "recipes_2.txt"
with open(ORIGINAL) as orig, open(EDITED, "w") as edited: # Удаляем все пустые строки и записываем в новый файл
    for line in orig:
        if line.strip():
            edited.write(line)

with open('recipes_2.txt', encoding='utf-8') as f:
    for line in f:
        dish_name = line.strip()
        ingredients_qty = int(f.readline().strip())
        for ingredient_line in range(ingredients_qty):
            ingredients_qty -= 1
            ingredient_dict = {}
            item1, item2, item3 = f.readline().split("|")
            ingredient_dict['ingredient_name'] = item1.strip()
            ingredient_dict['quantity'] = int(item2.strip())
            ingredient_dict['measure'] = item3.strip()
            ingredients_list.append(ingredient_dict)
            cook_book[dish_name] = ingredients_list
        ingredients_list = []

# Задача №2

def get_shop_list_by_dishes(dishes, person_count):
    need_purch = {}
    dishes_list = cook_book.keys()
    for dish in dishes:
        if dish in dishes_list:
            products = cook_book[dish]
            for product in products:
                product_count = product.get('quantity') * person_count
                need_purch[product.get('ingredient_name')] = {'quantity': product_count,
                                                              'measure': product.get('measure')}
    return need_purch


pprint.pprint(get_shop_list_by_dishes(['Запеченный картофель', 'Картофель по мексикански'], 2))
