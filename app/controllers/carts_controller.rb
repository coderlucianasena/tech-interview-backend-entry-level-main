class CartsController < ApplicationController
  # Adiciona um produto ao carrinho
  def add_product
    cart = current_cart
    product = Product.find(params[:product_id])

    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += params[:quantity].to_i
    cart_item.save!

    render json: cart_payload(cart), status: :ok
  end

  # Lista itens do carrinho atual
  def show
    cart = current_cart
    return render json: { error: 'Cart not found' }, status: :not_found unless cart

    render json: cart_payload(cart), status: :ok
  end

  # Altera quantidade de um produto no carrinho
  def update_quantity
    cart = current_cart
    return render json: { error: 'Cart not found' }, status: :not_found unless cart

    cart_item = cart.cart_items.find_by(product_id: params[:product_id])
    return render json: { error: 'Product not found in cart' }, status: :not_found unless cart_item

    if params[:quantity].to_i <= 0
      return render json: { error: 'Quantity must be greater than zero' }, status: :unprocessable_entity
    end

    cart_item.update!(quantity: params[:quantity].to_i)

    render json: cart_payload(cart), status: :ok
  end

  # Remove um produto do carrinho
  def remove_product
    cart = current_cart
    return render json: { error: 'Cart not found' }, status: :not_found unless cart

    cart_item = cart.cart_items.find_by(product_id: params[:product_id])
    return render json: { error: 'Product not found in cart' }, status: :not_found unless cart_item

    cart_item.destroy!

    render json: cart_payload(cart), status: :ok
  end

  private

  # Helper para obter ou criar o carrinho atual
  def current_cart
    session[:cart_id] ||= Cart.create.id
    Cart.find(session[:cart_id])
  end

  # Helper para montar o payload do carrinho
  def cart_payload(cart)
    {
      id: cart.id,
      products: cart.cart_items.map do |item|
        {
          id: item.product.id,
          name: item.product.name,
          quantity: item.quantity,
          unit_price: item.product.price,
          total_price: item.quantity * item.product.price
        }
      end,
      total_price: cart.cart_items.sum { |item| item.quantity * item.product.price }
    }
  end
end
