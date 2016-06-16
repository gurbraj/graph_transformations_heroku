class FunctionsController < ApplicationController

  def index
    @functions=Function.all
  end

  def new
    @function=Function.new()
  end

  def create
    function_params=params.require(:function).permit(:name)
    @function=Function.new(function_params)

    if @function.save
      flash[:notice]= "function saved"
      redirect_to function_path(@function)
    else
      #validations
      flash[:alert]= ""
    end

  end

  def show
    @model_function=Function.find params[:id]
    @func=MathFunctions::Servicefunction.new(-50,50, @model_function.name)

    def a_transformed
      params['a']=="" ? 1: params['a'].to_f
    end

    def b_transformed
      params['b']=="" ? 1: params['b'].to_f
    end

    def h_transformed
      params['h']=="" ? 0: params['h'].to_f
    end

    def k_transformed
      params['k']=="" ? 0: params['k'].to_f
    end

    respond_to do |format|
      format.html {render}
      format.json {render json: [@func.x_vals, @func.y_vals(a=a_transformed,
        b=b_transformed,
        h=h_transformed,
        k=k_transformed
        )
        ]}
    end
  end

end
