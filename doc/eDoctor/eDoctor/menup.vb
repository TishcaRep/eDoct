Public Class menup
    Private Sub NuevaRecetaToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NuevaRecetaToolStripMenuItem.Click
        pacientenreceta.Show()
    End Sub
    Private Sub PasienteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PasienteToolStripMenuItem.Click
        pasiente.Show()
    End Sub
    Private Sub MedicamentoToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MedicamentoToolStripMenuItem.Click
        medicamento.Show()
    End Sub
    Private Sub REceToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles REceToolStripMenuItem.Click
        recetas.Show()
    End Sub
    Private Sub FacturasToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FacturasToolStripMenuItem.Click
        facturas.Show()
    End Sub
End Class