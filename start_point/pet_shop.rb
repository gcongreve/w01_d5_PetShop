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
