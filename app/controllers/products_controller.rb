class ProductsController < ApplicationController
    
    def new
        @product = Product.new
    end
    
    def show
        @product = Product.find(params[:id])
    end

    def index
        @products = Product.all
    end

    def create
        @product = Product.new product_params    
        if @product.save
            redirect_to @product
        else
            render 'new'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end
    
    def edit
        @product = Product.find(params[:id])
        render "update"
    end

    def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
            redirect_to @product
        else
            render 'edit'
        end
    end
    
    private
       def product_params 
        params.require(:product).permit(:name , :depscription)
       end
end
