class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  def index
    @admins = Admin.with_full_access
  end

  def new
    @admins = Admin.new 
  end

  def create
    @admins = Admin.new(params_admin)
    if @admins.save 
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admins.email}) foi cadastrado com sucesso."
    else 
      render :new 
    end
  end
  
  def edit
  end

  def update
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admins.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admins.email}) foi alterado com sucesso."
    else 
      render :edit 
    end

  end
  
  def destroy
    admin_email = @admins.email

    if @admins.destroy
    redirect_to backoffice_admins_path, notice: "O Administrador (#{admin_email}) foi excluído com sucesso."
    else
        render :index
    end
  end
  
  private 
  def set_admin
    @admins = Admin.find(params[:id]) 
  end
  
  def params_admin
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

end
