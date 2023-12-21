<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina Maestra/MP_PaginaBase.Master" AutoEventWireup="true" CodeBehind="Invitaciones.aspx.cs" Inherits="Presentacion.Pagina_Maestra.Invitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sistema de Gestion de Minutas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenedorBase" runat="server">
    <!DOCTYPE html>
    <body>
        <div class="container-fluid">
                <p class="text-dark font-weight-bold m-0" style="color:black;font-size:20px; margin: 0; padding: 0;" width:100%;>Modulo de Invitaciones</p>
            <div class="encabezado" style="padding-top:5px; border-top: 2px solid black;">
                <asp:Panel ID="PnlCapturaDatos" runat="server">
                <br />
                <div class="container">
                          <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <div class="card">
                    <div id="CardHeader" runat="server">
                        <h5 class="card-title"><asp:Label ID="lblAccion" runat="server" CssClass="text-white"></asp:Label></h5>
                    </div>
                    <div class="card-body">
                         <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-2 col-md-6">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Fecha</p>
                                <asp:TextBox ID="TbLugar" runat="server" CssClass="form-control"></asp:TextBox>    
                                <asp:RequiredFieldValidator ID="RfvLugar" Forecolor="Red" runat="server" ControlToValidate="TbLugar" ErrorMessage="Coloque el lugar"></asp:RequiredFieldValidator>
                            </div>
                             </div>

                            <div class="col-1 col-md-6">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Lugar</p>
                                <asp:TextBox ID="TbFecha" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvFecha" Forecolor="Red" runat="server"  ControlToValidate="TbFecha" ErrorMessage="Coloque la fecha"></asp:RequiredFieldValidator>

                            </div>
                             </div>
                       </div>
                        <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Orden del dia</p>
                                <asp:TextBox ID="TbObjetivo" runat="server" CssClass="form-control"></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RfvObjetivo" Forecolor="Red" runat="server" ControlToValidate="TbObjetivo" ErrorMessage="Coloque el objetivo"></asp:RequiredFieldValidator>

                            </div>
                             </div>
                        </div>

                         <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Asunto</p>
                                <asp:TextBox ID="TbAsunto" runat="server" CssClass="form-control"></asp:TextBox>     
                                <asp:RequiredFieldValidator ID="RfvAsunto" Forecolor="Red" runat="server"  ControlToValidate="TbAsunto" ErrorMessage="Coloque el asunto"></asp:RequiredFieldValidator>

                            </div>
                             </div>
                        </div>
                                                 
                        <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0 text-md-center">Carrera</p>
                                <asp:DropDownList ID="DdlCarrera" runat="server" DataSourceID="SqlDataSource2" DataTextField="Carrera" DataValueField="IdCarrera"></asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionBD %>" SelectCommand="SELECT [IdCarrera], [Carrera] FROM [Carreras]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
                            </div>
                             </div>
                        </div>

                           <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Copia Correo a mandar</p>
                                <asp:TextBox ID="TbCopia" runat="server" CssClass="form-control"></asp:TextBox>     
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Forecolor="Red" runat="server"  ControlToValidate="TbAsunto" ErrorMessage="Coloque el asunto"></asp:RequiredFieldValidator>

                            </div>
                             </div>
                        </div>

                         </div>      
                                 <!---MODAL ENVIO--->
                <div class="modal fade" id="ModalEnvio" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-success text-white">
                             <h5 class="modal-title">CORREO ENVIADO</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>Se ha enviado el correo</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="BtnAceptar" runat="server" CssClass="btn btn-success" Text="Aceptar" />
                         </div>
                     </div>
                 </div>
                </div>

                                                     <!---MODAL NO CORREOS--->
                <div class="modal fade" id="ModalNoCorreos" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-dark text-white">
                             <h5 class="modal-title">ERROR</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>No existen usuarios asignados a esa carrera</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="BtnAcep" runat="server" CssClass="btn btn-success" Text="Aceptar" />
                         </div>
                     </div>
                 </div>
                </div>
                                                     <!---MODAL ERROR--->
                <div class="modal fade" id="ModalError" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-danger text-white">
                             <h5 class="modal-title">ERROR</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>Ha ocurrido un error al intentar enviarse el correo, volver a intentarlo.</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Aceptar" />
                         </div>
                     </div>
                 </div>
                </div>
                                <asp:Button ID="BtnEnviar" runat="server" Text="Enviar" OnClick="BtnEnviar_Click" CausesValidation="true" />

                </div>
                    </div>
            </asp:Panel>
        </div>
</div></html></body></asp:Content>