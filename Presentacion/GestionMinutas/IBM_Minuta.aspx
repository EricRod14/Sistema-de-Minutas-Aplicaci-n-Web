<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IBM_Minuta.aspx.cs" Inherits="Presentacion.GestionMinutas.IBM_Minuta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sistema de Gestion de Minutas</title>
    <link href="../CSS/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="text-primary text-center mt-5">Sistema de Gestion de Minutas</h1>
            <asp:Panel ID="PnlTabla" runat="server">
                <asp:GridView ID="GrvMinuta" runat="server">
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="PnlCapturaDatos" runat="server">
                <div class="card">
                    <div id="CardHeader" runat="server" class="card-header text-center bg-success text-white">
                        <h4 class="card-title">Captura de datos</h4>
                    </div>
                    <div class="card-body">

                         <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-2 col-md-6">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Lugar</p>
                                <asp:TextBox ID="TbLugar" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvLugar" runat="server" ErrorMessage="Capture Lugar" CssClass="text-danger font-italic" ControlToValidate="TbFecha"></asp:RequiredFieldValidator>
                            </div>
                             </div>

                            <div class="col-1 col-md-6">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Fecha(YYYY/MM/DD)</p>
                                <asp:TextBox ID="TbFecha" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ErrorMessage="Capture Fecha" CssClass="text-danger font-italic" ControlToValidate="TbFecha"></asp:RequiredFieldValidator>
                            </div>
                             </div>
                       </div>
                        <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Objetivo</p>
                                <asp:TextBox ID="TbObjetivo" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvObjetivo" runat="server" ErrorMessage="Capture Objetivo de la reunion" CssClass="text-danger font-italic" ControlToValidate="TbObjetivo"></asp:RequiredFieldValidator>
                            </div>
                             </div>
                        </div>

                         <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Asunto</p>
                                <asp:TextBox ID="TbAsunto" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvAsunto" runat="server" ErrorMessage="Capture el Asunto de la Minuta" CssClass="text-danger font-italic" ControlToValidate="TbAsunto"></asp:RequiredFieldValidator>
                            </div>
                             </div>
                        </div>
                                                 
                        <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0 text-md-center">Lista de participantes</p>
                                <p class="text-dark font-weight-bold m-0">1.-</p>
                                <asp:TextBox ID="TbParticipante" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvParticipante" runat="server" ErrorMessage="Capture al participante" CssClass="text-danger font-italic" ControlToValidate="TbParticipante"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">2.-</p>
                                <asp:TextBox ID="TbParticipante2" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvParticipante2" runat="server" ErrorMessage="Capture al participante" CssClass="text-danger font-italic" ControlToValidate="TbParticipante"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">3.-</p>
                                <asp:TextBox ID="TbParticipante3" runat="server" CssClass="form-control"></asp:TextBox>           
                            </div>
                             </div>
                        </div>
                        <p class="text-dark font-weight-bold m-0 text-md-center">Compromisos</p>
                            <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-2 col-md-5">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Tarea</p>
                                <p class="text-dark font-weight-bold m-0">1.-</p>
                                <asp:TextBox ID="TbTarea" runat="server" CssClass="form-control"></asp:TextBox>  
                                <asp:RequiredFieldValidator ID="rfvTarea" runat="server" ErrorMessage="Capture Tarea" CssClass="text-danger font-italic" ControlToValidate="TbTarea"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">2.-</p>
                                <asp:TextBox ID="TbTarea2" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvTarea2" runat="server" ErrorMessage="Capture Tarea" CssClass="text-danger font-italic" ControlToValidate="TbTarea2"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">3.-</p>
                                <asp:TextBox ID="TbTarea3" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvTarea3" runat="server" ErrorMessage="Capture Tarea" CssClass="text-danger font-italic" ControlToValidate="TbTarea3"></asp:RequiredFieldValidator>
                              </div>    
                               </div>
                            <div class="col-2 col-md-5">
                            <div class="form-group">    
                                <p class="text-dark font-weight-bold m-0">Responsable</p>
                                <p class="text-dark font-weight-bold m-0">1.-</p>
                                <asp:TextBox ID="TbResponsable" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvResponsable" runat="server" ErrorMessage="Capture al responsable" CssClass="text-danger font-italic" ControlToValidate="TbResponsable"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">2.-</p>
                                <asp:TextBox ID="TbResponsable2" runat="server" CssClass="form-control"></asp:TextBox>      
                                <asp:RequiredFieldValidator ID="rfvResponsable2" runat="server" ErrorMessage="Capture al responsable" CssClass="text-danger font-italic" ControlToValidate="TbResponsable"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">3.-</p>
                                <asp:TextBox ID="TbResponsable3" runat="server" CssClass="form-control"></asp:TextBox>      

                            </div>
                              </div>
                        </div>
                         </div>          

                    <div class="card-footer">
                        <asp:Button ID="BtnInsertar" runat="server" CssClass="btn btn-sm btn-success" Text="Grabar" OnClick="BtnInsertar_Click"/>
                    </div>
                </div>
            </asp:Panel>
        </div>
                <asp:HiddenField ID="hfIdMinuta" runat="server" />
    </form>
</body>
</html>
