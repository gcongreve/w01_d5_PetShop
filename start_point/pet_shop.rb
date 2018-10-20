def pet_shop_name(pet_shop_hash)
  return pet_shop_hash[:name]
end

def total_cash(pet_shop_hash)
  return pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, cash_amount)
  return pet_shop_hash[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop_hash)
  return pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_hash, pets_sold)
  return pet_shop_hash[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop_hash)
  return pet_shop_hash[:pets].size
end


def pets_by_breed(pet_shop_hash, pet_breed)
  breed_array = []
  for pet in pet_shop_hash[:pets]
    if pet[:breed] == pet_breed
      breed_array << pet[:breed]
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end


def remove_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
    if pet[:name] == pet_name
      pet_shop_hash[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop_hash, new_pet)
  pet_shop_hash[:pets] << new_pet
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
  customer[:pets] << pet
end

#OPTIONAL

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop_hash, pet, customer)
  #pet not found
  if pet == nil
    return "Pet not found"
  end
  #insufficient funds
  if customer_cash(customer) < pet[:price]
    return "insufficient funds"
  end
  #sufficient funds & pet found
  add_pet_to_customer(customer, pet)
  remove_customer_cash(customer, pet[:price])
  increase_pets_sold(pet_shop_hash, 1)
  add_or_remove_cash(pet_shop_hash, pet[:price])
end
