Imports MySql.Data
Imports MySql.Data.Types
Imports MySql.Data.MySqlClient
Public Class Frlogin
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If (existeusuario(txtusuario.Text, txtpassword.Text)) Then
            Me.Hide()
            menup.Show()
        End If

    End Sub
    Private Sub Vaciar_Focalizar() 'Declaramos el metodo de manera privada.
        txtpassword.Clear() ' limpia txtpassword
        txtusuario.Clear() ' limpia txtusuario
        txtusuario.Focus() ' pone el foco en txtusuario
    End Sub
    Function existeusuario(ByVal usuario As String, ByVal password As String)
        Dim oConexion As New MySqlConnection
        Dim oAdaptador As MySqlDataAdapter
        Dim oDataSet As New DataSet
        Dim sSql As String
        Dim sw As Boolean = False
        Try
            oConexion.ConnectionString = "Server=localhost;database=edoctor;user id=root;password=;"
            sSql = "SELECT * FROM `edo_medico` WHERE `edo_medico_usuario` = '" & usuario & "' AND `edo_medico_password` = '" & password & "'"
            oConexion.Open()
            oAdaptador = New MySqlDataAdapter(sSql, oConexion)
            oDataSet.Clear()
            oAdaptador.Fill(oDataSet, "edo_medico")
            If (oDataSet.Tables("edo_medico").Rows.Count() <> 0) Then
                MessageBox.Show("Welcome to system", "Sistema")
                sw = True
                Dim dr As DataRowView = BindingContext(oDataSet, "edo_medico").Current
                idoc = dr("edo_medico_id")
            Else
                MessageBox.Show("Usuario y/o contraseña son incorrectos", "Sistema")
                sw = False
            End If

        Catch ex As Exception
           
        End Try
        oConexion.Close()
        Return (sw)
    End Function
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Close()
    End Sub

    Private Sub Frlogin_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
