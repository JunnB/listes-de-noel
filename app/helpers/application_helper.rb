module ApplicationHelper
  def toast_infos(type)
    color, svg_path = case type
    when "success", "notice"
      ["green", "M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 8.207-4 4a1 1 0 0 1-1.414 0l-2-2a1 1 0 0 1 1.414-1.414L9 10.586l3.293-3.293a1 1 0 0 1 1.414 1.414Z"]
    when "danger", :alert, "alert"
      ["red", "M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"]
    when "warning"
      ["orange", "M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM10 15a1 1 0 1 1 0-2 1 1 0 0 1 0 2Zm1-4a1 1 0 0 1-2 0V6a1 1 0 0 1 2 0v5Z"]
    else
      ["gray", ""]
    end
    return color, svg_path
  end

  def toogle_tag(options: {})
    text = options[:text] || "Toggle"
    label_class = "relative inline-flex items-center cursor-pointer"
    input_class = "sr-only peer"
    div_class = "w-11 h-6 bg-gray-200 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"
    span_class = "ms-3 text-sm font-medium text-gray-400 dark:text-gray-500"

    html = <<~HTML
      <label class="#{label_class}">
        <input type="checkbox" value="" class="#{input_class}" #{options[:checked] ? "checked" : ""} #{options[:disabled] ? "disabled" : ""}>
        <div class="#{div_class}"></div>
        <span class="#{span_class}">#{text}</span>
      </label>
    HTML

    puts html
  end
end
