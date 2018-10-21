def pet_shop_name(pet_shop_hash)
  pet_shop_hash[:name]
end

def total_cash(pet_shop_hash)
  pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, cash_amount)
  pet_shop_hash[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop_hash)
  pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_hash, pets_sold)
  pet_shop_hash[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop_hash)
  pet_shop_hash[:pets].size
end

def pets_by_breed(pet_shop_hash, pet_breed)
  breed_array = []
  for pet in pet_shop_hash[:pets]
    breed_array.push(pet[:breed]) if pet[:breed] == pet_breed
  end
  return breed_array
end

def find_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end


def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    pet_shop[:pets].delete(pet) if pet[:name] == pet_name
  end
end

def add_pet_to_stock(pet_shop_hash, new_pet)
  pet_shop_hash[:pets].push(new_pet)
end

def customer_cash(customer)
  customer[:cash]
end

def remove_customer_cash(customer, cash_amount)
  customer[:cash] -= cash_amount
end

def customer_pet_count(customer)
  customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

#OPTIONAL

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop_hash, pet, customer)
  #pet not found
  return "Pet not found" if pet == nil
  #insufficient funds
  if customer_can_afford_pet(customer, pet) == false
    return "insufficient funds"
  end
  #sufficient funds & pet found
  add_pet_to_customer(customer, pet)
  remove_customer_cash(customer, pet[:price])
  increase_pets_sold(pet_shop_hash, 1)
  add_or_remove_cash(pet_shop_hash, pet[:price])
end
