Public Class pantallalog
    Dim i As Integer
    Private Sub pantallalog_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Timer1.Interval = 1
        Timer1.Enabled = True
    End Sub
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If i < ProgressBar1.Maximum Then
            ProgressBar1.Value = i
            i += 1
        Else
            Timer1.Enabled = False
            Frlogin.Show()
            Me.Hide()
        End If
    End Sub
End Class