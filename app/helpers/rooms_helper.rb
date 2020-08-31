module RoomsHelper
  def  is_done?(item)
    unless item.blank?
      content_tag :span, class: "" do
        content_tag :i, nil, class: "fa fa-check float-right"
      end
    end
  end

  def is_not_ready?(room)
    room.price.blank? || room.name.blank? || room.photos.blank? || room.address.blank?
  end
end
