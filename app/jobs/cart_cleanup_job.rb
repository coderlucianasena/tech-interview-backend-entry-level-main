class CartCleanupJob < ApplicationJob
    queue_as :default
  
    def perform
      # Marca como abandonados os carrinhos inativos por mais de 3 horas
      abandoned_carts = Cart.where('updated_at < ?', 3.hours.ago)
      abandoned_carts.update_all(status: 'abandoned')
  
      # Exclui os carrinhos marcados como abandonados por mais de 7 dias
      carts_to_delete = Cart.where('updated_at < ?', 7.days.ago).where(status: 'abandoned')
      carts_to_delete.destroy_all
    end
  end
  