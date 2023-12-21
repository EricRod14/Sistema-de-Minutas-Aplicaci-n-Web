<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="CSS/CSS.css" rel="stylesheet" />
    <title>Login</title>
    <style>
        body {
            background-image: url("../Imagenes/Component%206.png")
        }
.wrapper 
{

    display:flex;
    align-items: center;
    flex-direction:column;
    justify-content: center;
    width:100%;
    min-height:100%;
    padding:20px;
}
#formcontent 
{
    -webkit-border-radius:10px 10px 10px 10px;
    border-radius:10px 10px 10px 10px;
    background:#fff;
    padding:30px;
    width:90%;
    max-width:450px;
    position:relative;
    padding: 0px;
    -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
    box-shadow:0 30px 60px 0 rgba(0,0,0,0.3);
    text-align:center;
}
    </style>
</head>
<body class="bg-light">
<div class="wrapper">
    <div class="formcontent">
     <form id="formulario_login" runat="server">
                                 <!---Modal Error--->
                <div class="modal fade" id="ModalError" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-dark text-white">
                             <h5 class="modal-title">ERROR</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>Error al iniciar sesion. Inténtelo de nuevo.</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="BtnAceptar" runat="server" CssClass="btn btn-success" Text="Aceptar"/>
                         </div>
                     </div>
                 </div>
                </div>
       <div class="form-control">
           <div style="text-align:center">
               <asp:Label class="h3" ID="lblBienvenida" runat="server" Text="Bienvenido al Sistema"></asp:Label>
               <br />
               <img src="https://citecuvp.tij.uabc.mx/wp-content/uploads/2019/09/ISOTIPO-UABC-FULL-COLOR-PARA-FONDO-CLARO.png" width="125" height="100"/>
           </div>
           <div>
               <asp:Label ID="lblCorreo" runat="server" Text="Correo:"></asp:Label>
               <asp:TextBox ID="tbCorreo" Text="@uabc.edu.mx" CssClass="form-control" runat="server" placeholder="Correo del Usuario"></asp:TextBox>
           </div>
         <div>
               <asp:Label ID="lblClave" runat="server" Text="Contraseña:"></asp:Label>
               <asp:TextBox ID="tbClave" TextMode="Password" CssClass="form-control"  runat="server" placeholder="Clave" OnTextChanged="tbClave_TextChanged"></asp:TextBox>
         </div>
           <hr />
           <div class="row">
               <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
                <asp:Label ID="LblMensaje" runat="server" CssClass="font-weight-bold"></asp:Label></div>
           </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>       
         </form>
       </div> 
    </div> 
</body>
</html>
