class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]
  def index
    @admins = Admin.all
  end

  def new
    @admins = Admin.new 
  end

  def create
    @admins = CateAdmingory.new(params_admin)
    if @admins.save 
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admins.email}) foi cadastrado com sucesso."
    else 
      render :new 
    end
  end
  
  def edit
  end

  def update
    if @admins.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admins.email}) foi alterado com sucesso."
    else 
      render :edit 
    end
  end
  
  private 
  def set_admin
    @admins = Admin.find(params[:id]) 
  end
  
  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
