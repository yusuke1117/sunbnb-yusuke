module RoomsHelper
    def is_done?(item)
        if !item.blank?
            content_tag :span, class: "pull-right text-babu" do
                content_tag :i, nil, class: "fa fa-check"
            end
        end
    end
end
