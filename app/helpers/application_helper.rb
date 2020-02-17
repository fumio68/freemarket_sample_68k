module ApplicationHelper
  def search_images(itemId)
    result = Item_image.where(item_id: itemId)
    # result = result.image
    return result
  end
end
