class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def subtotal
    item.with_tax_price * amount
  end

  def create
    @model_class_name = ModelClassName.new(params[:model_class_name])

    respond_to do |wants|
      if @model_class_name.save
        flash[:notice] = 'ModelClassName was successfully created.'
        wants.html { redirect_to(@model_class_name) }
        wants.xml  { render :xml => @model_class_name, :status => :created, :location => @model_class_name }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @model_class_name.errors, :status => :unprocessable_entity }
      end
    end
  end
end
