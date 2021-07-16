class IngredientsController < ApplicationController

    before_action :find_ingredient, only: [:show, :edit, :update]

    def index
        @ingredients = Ingredient.all
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end

    end

    def edit
    end

    def update

        @ingredient.update(ingredient_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end

    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def find_ingredient
        @ingredient = Ingredient.find_by_id(params[:id])
    end

end
