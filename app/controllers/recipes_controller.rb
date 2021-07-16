class RecipesController < ApplicationController

    before_action :find_recipe, only: [:show, :edit, :update]

    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end

    end

    def edit
    end

    def update

        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end

    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end


end
