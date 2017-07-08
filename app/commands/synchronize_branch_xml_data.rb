class SynchronizeBranchXmlData
  prepend SimpleCommand

  def initialize branch, file_path
    @branch = branch
    @file_path = file_path
  end

  def call
    return unless validate_data_file && check_branch_permission
    sync_data
  end

  private
  attr_reader :file_path, :branch

  def validate_data_file
    validation_command = ValidateBranchXmlData.call file_path
    if validation_command.success?
      true
    else
      errors.add_multiple_errors validation_command.errors
      false
    end
  end

  def xml_data
    @xml_data ||= Nokogiri::XML(File.read file_path).root
  end

  def check_branch_permission
    data_branch_id = xml_data.at("general_info").at("id").content
    if branch.id.to_s == data_branch_id
      true
    else
      errors.add :branch_permission, "You have no permission to synchronize data of this branch"
      false
    end
  end

  def sync_data
    ActiveRecord::Base.transaction do
      sync_general_info
      sync_employees_data
      sync_customers_data
      sync_products_data
      sync_orders_and_order_details_data
      true
    end
  rescue Exception => e
    errors.add :synchronize_data, e.message
    false
  end

  def sync_general_info
    general_info = xml_data.at "general_info"
    branch.update_attributes! name: general_info.at("name").content,
      address: general_info.at("address").content,
      phone_number: general_info.at("telephone").content,
      working_time: general_info.at("working_time").content
  end

  def sync_employees_data
    employees_data = xml_data.at "employees"
    employees_data.elements.each do |employee_data|
      employee = Employee.find_or_initialize_by id: employee_data.at("id").content
      employee.assign_attributes name: employee_data.at("name").content,
        gender: employee_data.at("gender").content.to_i,
        phone_number: employee_data.at("phone").content,
        role: employee_data.at("role").content.to_i,
        branch: branch
      employee.save!
    end
  end

  def sync_customers_data
    customers_data = xml_data.at "customers"
    customers_data.elements.each do |customer_data|
      customer = Customer.find_or_initialize_by id: customer_data.at("id").content
      customer.assign_attributes name: customer_data.at("name").content,
        gender: customer_data.at("gender").content.to_i,
        phone_number: customer_data.at("phone").content,
        address: customer_data.at("address").content,
        point: customer_data.at("point").content,
        level: customer_data.at("level").content.to_i,
        branch: branch
      customer.save!
    end
  end

  def sync_products_data
    products_data = xml_data.at "products"
    products_data.elements.each do |product_data|
      product_id = product_data.at("id").content
      branch_product = BranchProduct.find_or_initialize_by branch: branch, product_id: product_id
      branch_product.assign_attributes quantity: product_data.at("quantity").content
      branch_product.save!
    end
  end

  def sync_orders_and_order_details_data
    orders_data = xml_data.at "orders"
    orders_data.elements.each do |order_data|
      order = Order.find_or_initialize_by id: order_data.at("id").content
      order.assign_attributes customer_id: order_data.at("customer_id").content,
        employee_id: order_data.at("employee_id").content,
        time: order_data.at("time").content,
        total_price: order_data.at("total_price").content,
        branch: branch
      order.save!
      sync_order_details_data order, order_data.at("order_details")
    end
  end

  def sync_order_details_data order, order_details_data
    order_details_data.elements.each do |order_detail_data|
      order_detail = OrderDetail.find_or_initialize_by id: qrorder_detail_data.at("id").content
      order_detail.assign_attributes order: order,
        product_id: order_detail_data.at("product_id").content,
        quantity: order_detail_data.at("quantity").content,
        unit_price: order_detail_data.at("unit_price").content
      order_detail.save!
    end
  end
end
