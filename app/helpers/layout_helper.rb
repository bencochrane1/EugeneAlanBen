module LayoutHelper
  def flash_messages(opts={})
    @layout_flash = opts.fetch(:layout_flash) { true }

    capture do
      flash.each do |name, msg|
        # concat content_tag(:div, msg, id: "flash_#{name}")
        concat content_tag(:div, msg, class: "alert alert-success")
      end
    end
  end

  def show_layout_flash?
    @layout_flash.nil? ? true : @layout_flash
  end
end