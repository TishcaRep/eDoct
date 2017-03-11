Public Class menup


    Private Sub menu_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub PasienteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PasienteToolStripMenuItem.Click

    End Sub

    Private Sub NuevaRecetaToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NuevaRecetaToolStripMenuItem.Click
        pacientenreceta.Show()
    End Sub
End Class