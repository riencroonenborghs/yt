module ApplicationHelper
  def body_classes
    classes = [controller.controller_name]
    classes << controller.action_name
    classes << 'user' if user_signed_in?
    classes.join(' ')
  end

  # ICONS
  def edit_icon(options = {})
    options = {size: 'md'}.merge!(options)
    "<span class='glyphicon glyphicon-edit btn-#{options[:size]}'></span>".html_safe
  end

  def delete_icon(options = {})
    options = {size: 'md'}.merge!(options)
    "<span class='glyphicon glyphicon-remove-circle btn-#{options[:size]}'></span>".html_safe
  end

  def list_icon(options = {})
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-th-list btn-#{options[:size]}'></span>".html_safe
  end
  
  def add_icon(options = {})
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-plus btn-#{options[:size]}'></span>".html_safe
  end

  def graph_icon(options = {})
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-stats btn-#{options[:size]}'></span>".html_safe
  end

  def search_icon(options = {})
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-search btn-#{options[:size]}'></span>".html_safe
  end

  def ok_icon(options = {})
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-ok btn-#{options[:size]}'></span>".html_safe
  end

  def notice_icon
    '&#10004;'.html_safe
  end

  def chevron_down(options = {})    
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-chevron-down btn-#{options[:size]}'></span>".html_safe
  end

  def chevron_up(options = {})    
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-chevron-up btn-#{options[:size]}'></span>".html_safe
  end

  def chevron_right(options = {})    
    klass = options.delete(:class)
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-chevron-right btn-#{options[:size]} #{klass}'></span>".html_safe
  end

  def chevron_left(options = {})    
    klass = options.delete(:class)
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-chevron-left btn-#{options[:size]} #{klass}'></span>".html_safe
  end

  def import_icon(options = {})    
    options = {size: 'md'}.merge!(options)
    "<span class='glyphicon glyphicon-import btn-#{options[:size]}'></span>".html_safe
  end

  def save_icon(options = {})    
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-floppy-disk btn-#{options[:size]}'></span>".html_safe
  end

  def sent_icon(options = {})
    options = {size: 's'}.merge!(options)
    "<span class='glyphicon glyphicon-envelope btn-#{options[:size]}'></span>".html_safe
  end

  def paid_icon(options = {})
    options = {size: 's'}.merge!(options)
    "<span class='glyphicon glyphicon-usd btn-#{options[:size]}'></span>".html_safe
  end

  def download_icon(options = {})
    options = {size: 's'}.merge!(options)
    "<span class='glyphicon glyphicon-download-alt btn-#{options[:size]}'></span>".html_safe
  end

  def user_icon(options = {})
    options = {size: 'm'}.merge!(options)
    "<span class='glyphicon glyphicon-user btn-#{options[:size]}'></span>".html_safe
  end

  def hours_icon(options = {})
    options = {size: 'm'}.merge!(options)
    "<span class='glyphicon glyphicon-time btn-#{options[:size]}'></span>".html_safe
  end

  def calendar_icon(options = {})
    options = {size: 'xs'}.merge!(options)
    "<span class='glyphicon glyphicon-calendar btn-#{options[:size]}'></span>".html_safe
  end

  def admin_icon(options = {})
    options = {size: 'm'}.merge!(options)
    "<span class='glyphicon glyphicon-cog btn-#{options[:size]}'></span>".html_safe
  end

  def logout_icon(options = {})
    options = {size: 'm'}.merge!(options)
    "<span class='glyphicon glyphicon-off btn-#{options[:size]}'></span>".html_safe
  end

  def invoice_icon(options = {})
    options = {size: 'm'}.merge!(options)
    "<span class='glyphicon glyphicon-list-alt btn-#{options[:size]}'></span>".html_safe
  end
  

  # BUTTONS
  def save_button(label = 'Save')
    content_tag :button, class: 'btn btn-default save_button' do
      save_icon + label
    end
  end

  def cancel_link
    link_to 'Cancel', url_for(action: :index), class: 'cancel_link'
  end

  def search_button(label = 'Search')
    content_tag :button, class: 'btn btn-default' do
      search_icon + label
    end
  end

  # MENU HELPERS
  def active_menu(look)
    return '' unless defined?(@menu)
    @menu.first == look ? "active" : ''
  end

  def active_menu_item(*look)
    return '' unless defined?(@menu)
    @menu == look ? "class=active" : ''
  end

  # ROW - GRID HELPERS
  def bootstrap_row_and_grid(options = {})
    klass = options.delete(:class)
    options = {device_size: 'md', grid_size: 12, class: "row #{klass}"}.merge!(options)
    content_tag(:div, class: options[:class], style: options[:style], id: options[:id]) do
      content_tag(:div, class: "col-#{options[:device_size]}-#{options[:grid_size]}") do
        yield
      end
    end
  end

  def bootstrap_row(options = {})
    klass = options.delete(:class)
    options = {class: "row #{klass}"}.merge!(options)
    content_tag(:div, class: options[:class], style: options[:style], id: options[:id]) do
      yield
    end
  end

  def bootstrap_grid(options = {})
    options = {device_size: 'md', grid_size: 12}.merge!(options)
    content_tag(:div, class: "#{options[:class]} col-#{options[:device_size]}-#{options[:grid_size]}", style: options[:style], id: options[:id]) do
      yield
    end
  end
    
  # PANELS
  def bootstrap_panel(options = {})
    klass = options.delete(:class)
    content_tag :div, class: "panel panel-default #{klass}" do
      yield
    end
  end

  def bootstrap_panel_heading(options = {})
    klass = options.delete(:class)
    content_tag :div, class: "panel-heading #{klass}" do
      content_tag :div, class: "panel-title" do
        yield
      end
    end
  end

  # TABLES
  def bootstrap_table(options = {})
    klass = options.delete(:class)
    options = {hover: true, bordered: true}.merge!(options)
    content_tag :table, class: "table #{'table-bordered' if options[:bordered]} #{'table-hover' if options[:hover]} table-condensed #{klass}" do
      yield
    end
  end

  # PAGE HEADER
  def bootstrap_page_header(options = {})
    klass = options.delete(:class)
    content_tag :div, class: "page-header #{klass}" do
      content_tag :h3 do
        yield
      end
    end
  end  
end
