<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina Maestra/MP_PaginaBase.Master" AutoEventWireup="true" CodeBehind="IBM_Minuta.aspx.cs" Inherits="Presentacion.Pagina_Maestra.ModuloMinuta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sistema de Gestion de Minutas</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphContenedorBase" runat="server">
                     <p class="text-dark font-weight-bold m-0" style="color:black;font-size:19px; margin: 0; padding: 0;" >Gestión de minutas  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:Label ID="LblRol" runat="server"></asp:Label></p> 
                    <div class="encabezado" style="padding-top:5px; border-top: 1px solid black;"></div> 
    <!DOCTYPE html>
<body>
        <div class="container-fluid">
            <div class="botones" align="left" style="float:left">
               <asp:Button ID="BtnAgregar" runat="server" CssClass="btn btn-sm btn-success" Text="Nueva Minuta" OnClick="BtnAgregar_Click" />
               <asp:Button ID="BtnLista" runat="server" CssClass="btn btn-sm btn-success" Text="Listado Minutas" OnClick="BtnLista_Click"/>
<%--                <asp:Button ID="BtnPDF" runat="server" CssClass="btn btn-sm btn-success" Text="Listado PDF" OnClick="BtnPDF_Click"/>--%>
                <asp:Button ID="BtnUsuario" runat="server" CssClass="btn btn-sm btn-primary" Text="Crear Usuario" OnClick="BtnUsuario_Click"/>
                 <asp:Button ID="BtnInvitacion" runat="server" CssClass="btn btn-sm btn-primary" Text="Crear Invitacion" OnClick="BtnInvitacion_Click"/>
                <asp:LinkButton ID="BtnRecargar" CssClass="btn btn-sm btn-dark" runat="server" OnClick="BtnRegresar_Click"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
  <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
</svg></asp:LinkButton></div>

            <asp:Panel ID="pnlBuscar" runat="server" align="right">
                    <asp:TextBox ID="TbBuscar" runat="server" OnTextChanged="TbBuscar_TextChanged" placeholder="Criterio de busqueda" Width="352px" align="right"></asp:TextBox>
                     <asp:LinkButton ID="Btn_Buscar" runat="server" CssClass="btn btn-sm btn-success" OnClick="BtnBuscar_Click">Buscar</asp:LinkButton>
                </asp:Panel>
                            </div>
    <br>
                 <asp:Panel ID="PnlTabla" runat="server">
                <asp:GridView ID="GrvMinuta" runat="server" DataKeyNames="IdMinuta" HorizontalAlign="Left" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Vertical" OnRowEditing="GrvMinuta_RowEditing" OnSelectedIndexChanged="GrvMinuta_SelectedIndexChanged" OnRowDeleting="GrvMinuta_RowDeleting" AutoGenerateColumns="False" ForeColor="Black">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Objetivo" HeaderText="Objetivo" />
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditar" runat="server" 
                                CssClass="btn btn-sm btn-outline-primary" 
                                CommandName="Edit"
                                ToolTip="Editar Materia"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
  <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
</svg></asp:LinkButton>
                        </ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Borrar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnBorrar" runat="server" 
                                CssClass="btn btn-sm btn-outline-danger" 
                                CommandName="Delete"
                                ToolTip="Visualizar Minuta"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                  

                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>        
                     
                    <asp:GridView ID="GrvProfe" runat="server" DataKeyNames="IdMinuta" HorizontalAlign="Left" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Vertical" OnRowEditing="GrvMinuta_RowEditing" OnSelectedIndexChanged="GrvMinuta_SelectedIndexChanged" OnRowDeleting="GrvProfe_RowDeleting" AutoGenerateColumns="False" ForeColor="Black">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Objetivo" HeaderText="Objetivo" />
                           <asp:TemplateField HeaderText="Visualizar">
                        <ItemTemplate>
                            <asp:LinkButton ID="BtnView" runat="server" 
                                CssClass="btn btn-sm btn-outline-primary" 
                                 CommandName="Delete"
                                ToolTip="Visualizar Minuta"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
  <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
</svg></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>       
                <asp:Label ID="LblMensaje" runat="server" CssClass="font-weight-bold"></asp:Label>

            </asp:Panel>
                               
    
            <asp:Panel ID="PnlCapturaDatos" runat="server">
                    <br>
                <div class="container">
                <div class="card">
                    <div id="CardHeader" runat="server">
                        <h5 class="card-title"><asp:Label ID="lblAccion" runat="server" CssClass="text-white"></asp:Label></h5>
                    </div>
                    <div class="card-body">

                         <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-2 col-md-6">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Lugar</p>
                                <asp:TextBox ID="TbLugar" runat="server" CssClass="form-control"></asp:TextBox>    
                                <asp:RequiredFieldValidator ID="RfvLugar" Forecolor="Red" runat="server" ControlToValidate="TbLugar" ErrorMessage="Coloque el lugar"></asp:RequiredFieldValidator>
                            </div>
                             </div>

                            <div class="col-1 col-md-6">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Fecha</p>
                                <asp:TextBox ID="TbFecha" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvFecha" Forecolor="Red" runat="server"  ControlToValidate="TbFecha" ErrorMessage="Coloque la fecha"></asp:RequiredFieldValidator>

                            </div>
                             </div>
                       </div>
                        <div class="row pl-2 pr-2 align-items-center">
                            <div class="col-12">
                            <div class="form-group">
                                <p class="text-dark font-weight-bold m-0">Objetivo</p>
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
                                <p class="text-dark font-weight-bold m-0 text-md-center">Lista de participantes</p>
                                <p class="text-dark font-weight-bold m-0">1.-</p>
                                <asp:TextBox ID="TbParticipante" runat="server" CssClass="form-control"></asp:TextBox>    
                                <asp:RequiredFieldValidator ID="RfvParticipante" Forecolor="Red" runat="server" ControlToValidate="TbParticipante" ErrorMessage="Coloque al participante"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">2.-</p>
                                <asp:TextBox ID="TbParticipante2" runat="server" CssClass="form-control"></asp:TextBox>     
                                <asp:RequiredFieldValidator ID="RfvParticipante2" Forecolor="Red" runat="server" ControlToValidate="TbParticipante2" ErrorMessage="Coloque al participante"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">3.-</p>
                                <asp:TextBox ID="TbParticipante3" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvParticipante3" Forecolor="Red" runat="server" ControlToValidate="TbParticipante3" ErrorMessage="Coloque al participante"></asp:RequiredFieldValidator>

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
                                <asp:RequiredFieldValidator ID="RfvTarea" runat="server" Forecolor="Red" ControlToValidate="TbTarea" ErrorMessage="Coloque la tarea"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">2.-</p>
                                <asp:TextBox ID="TbTarea2" runat="server" CssClass="form-control"></asp:TextBox>      
                                <p class="text-dark font-weight-bold m-0">3.-</p>
                                <asp:TextBox ID="TbTarea3" runat="server" CssClass="form-control"></asp:TextBox>      
                              </div>    
                               </div>
                            <div class="col-2 col-md-5">
                            <div class="form-group">    
                                <p class="text-dark font-weight-bold m-0">Responsable</p>
                                <p class="text-dark font-weight-bold m-0">1.-</p>
                                <asp:TextBox ID="TbResponsable" runat="server" CssClass="form-control"></asp:TextBox>   
                                <asp:RequiredFieldValidator ID="RfvResponsable" Forecolor="Red" runat="server" ControlToValidate="TbResponsable" ErrorMessage="Coloque al responsable de la tarea"></asp:RequiredFieldValidator>
                                <p class="text-dark font-weight-bold m-0">2.-</p>
                                <asp:TextBox ID="TbResponsable2" runat="server" CssClass="form-control"></asp:TextBox>      
                                <p class="text-dark font-weight-bold m-0">3.-</p>
                                <asp:TextBox ID="TbResponsable3" runat="server" CssClass="form-control"></asp:TextBox>      

                            </div>
                              </div>
                        </div>
                         </div>          
                    <div class="card-footer">
                        <asp:Button ID="BtnInsertar" runat="server" CssClass="btn btn-sm btn-success" Text="Grabar" OnClick="BtnInsertar_Click"/>
                        <asp:Button ID="BtnModificar" runat="server" CssClass="btn btn-sm btn-primary" Text="Modificar" OnClick="BtnModificar_Click"/>
                        <asp:Button ID="BtnBorrar" runat="server" CssClass="btn btn-sm btn-danger" Text="Borrar" OnClick="BtnBorrar_Click"/>
                        <asp:Button ID="BtnRegresar" runat="server" CssClass="btn btn-sm btn-dark" Text="Regresar" CausesValidation = "false" OnClick="BtnRegresar_Click"/>
                    </div>
                            </div>           

                        </div>

                        <!---Modales!-->

             <!---Borrar--->
                <div class="modal fade" id="ModalBorrar" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-danger text-white">
                             <h5 class="modal-title">CONFIRMAR CAMBIOS</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>¿Esta seguro que desea borrar la minuta?</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="BtnDelete" runat="server" CssClass="btn btn-danger" Text="Aceptar" OnClick="BtnDelete_Click"/>
                            <asp:Button ID="BtnReturn" runat="server" CssClass="btn btn-dark" Text="Regresar" OnClick="BtnRegresar_Click"/>

                         </div>
                     </div>
                 </div>
                </div>

                <!---Modificar--->
                <div class="modal fade" id="ModalModificar" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-primary text-white">
                             <h5 class="modal-title">CONFIRMAR CAMBIOS</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>¿Esta seguro que desea modificar la minuta?</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="BtnModify" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="BtnModify_Click"/>
                             <button type="button" class="btn btn-dark" data-dismiss="modal">Regresar</button>

                         </div>
                     </div>
                 </div>
                </div>

                <!---Exito--->
                <div class="modal fade" id="ModalExito" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-primary text-white">
                             <h5 class="modal-title">MINUTA GUARDADA</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>Se ha guardado la minuta</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Aceptar" OnClick="BtnModify_Click"/>
                             <button type="button" class="btn btn-dark" data-dismiss="modal">Regresar</button>

                         </div>
                     </div>
                 </div>
                </div>
                     </asp:Panel>
            
                <asp:HiddenField ID="hfIdMinuta" runat="server" />
    </body>

    </html>
</asp:Content>
