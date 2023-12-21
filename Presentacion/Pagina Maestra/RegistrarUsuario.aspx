<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina Maestra/MP_PaginaBase.Master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="Presentacion.Pagina_Maestra.RegistrarUsuario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphContenedorBase" runat="server">
    <p class="text-dark font-weight-bold" style="color: black; font-size: 20px; border-bottom: 2px solid black; margin: 0; padding: 0;">Creacion de Usuarios</p>

    <div class="container-fluid">
<%--        <asp:Panel ID="PnlTabla" runat="server">
            <asp:GridView ID="GrvUsuario" runat="server" AutoGenerateColumns="False" DataKeyNames="IdLogin" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdLogin" HeaderText="IdLogin" InsertVisible="False" ReadOnly="True" SortExpression="IdLogin" />
                    <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                    <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
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
                                ToolTip="Borrar Materia"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionBD %>" SelectCommand="SELECT u.IdLogin, u.Correo, c.Carrera, r.Rol from Usuario u, Roles r, Carreras c where c.IdCarrera= u.Carrera and r.IdRol = u.Rol"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" CssClass="font-weight-bold"></asp:Label>

        </asp:Panel>--%>
        <asp:Panel ID="PnlCapturaDatos" runat="server">
            <div class="card">
                <div id="CardHeader" class="card-header text-center bg-primary text-white" runat="server">
                    <h4 class="card-title">
                        <asp:Label ID="lblAccion" runat="server" CssClass="text-white">Crear de Usuario</asp:Label></h4>
                </div>
                <div class="card-body">

                    <p class="text-dark font-weight-bold">Correo</p>
                    <asp:TextBox ID="TbCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvCorreo" ForeColor="Red" runat="server" ControlToValidate="TbCorreo" ErrorMessage="Coloque el correo"></asp:RequiredFieldValidator>

                    <p class="text-dark font-weight-bold">Clave</p>
                    <asp:TextBox ID="TbClave" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvClave" ForeColor="Red" runat="server" ControlToValidate="TbClave" ErrorMessage="Coloque la clave"></asp:RequiredFieldValidator>

                    <p class="text-dark font-weight-bold">Rol</p>
                    <asp:DropDownList ID="DpRol" runat="server" DataSourceID="SqlDataSource2" DataTextField="Rol" DataValueField="IdRol"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionBD %>" SelectCommand="SELECT * FROM [Roles]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RfvRol" ForeColor="Red" runat="server" ControlToValidate="DpRol" ErrorMessage="Coloque el Rol"></asp:RequiredFieldValidator>

                    <p class="text-dark font-weight-bold">Carrera</p>
                    <asp:DropDownList ID="DpCarrera" runat="server" DataSourceID="SqlDataSource1" DataTextField="Carrera" DataValueField="IdCarrera"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionBD %>" OnSelecting="SqlDataSource1_Selecting1" SelectCommand="SELECT [Carrera], [IdCarrera] FROM [Carreras]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RfvCarrera" ForeColor="Red" runat="server" ControlToValidate="DpCarrera" ErrorMessage="Escoja la carrera"></asp:RequiredFieldValidator>
                </div>

                <div class="card-footer">
                    <asp:Button ID="BtnInsertar" runat="server" CssClass="btn btn-sm btn-success" Text="Grabar" OnClick="BtnInsertar_Click" />
                    <asp:Button ID="BtnRegresar" runat="server" CssClass="btn btn-sm btn-dark" Text="Regresar" CausesValidation="false" OnClick="BtnRegresar_Click" />
                    <asp:Label ID="LblMensaje" runat="server"></asp:Label>
                </div>

            </div>
                                                                 <!---MODAL EXITO--->
                <div class="modal fade" id="ModalExito" tabindex="-1" data-backdrop="static" data-keyboard="false">
                 <div class="modal-dialog modal-lg modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header bg-success text-white">
                             <h5 class="modal-title">USUARIO REGISTRADO</h5>
                             <button type="button" class="close" data-dismiss="modal">X</button>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-12">
                                     <h6>Se ha registrado el usuario en la base de datos</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="BtnAcep" runat="server" CausesValidation = "false" CssClass="btn btn-success" Text="Aceptar" />
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
                                     <h6>Ha ocurrido un error al intentar guardar al usuario en la base de datos</h6>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                            <asp:Button ID="Button1" runat="server"  CausesValidation = "false" CssClass="btn btn-success" Text="Aceptar" />
                         </div>
                     </div>
                 </div>
                </div>
        </asp:Panel>
                        <asp:HiddenField ID="hfIdUsuario" runat="server" />

    </div>
</asp:Content>
