@using $rootnamespace$.Controllers
@{
    ViewBag.Title = "Index";
    Layout = "~/Views/Shared/_ModalLoginLayout.cshtml";
}
<style>
    body {
        padding-top: 50px;
    }

    .form-horizontal .control-label {
        padding-top: 10px;
        text-align: left;
    }
</style>
<script>

    $(function () {

        $("#iswinauthentication").change(function () {

            if ($(this).is(":checked")) {
                $("#userid").removeAttr("required");
                $("#password").removeAttr("required");

                $("#userid").attr("disabled", "disabled");
                $("#password").attr("disabled", "disabled");
            }
            else {
                $("#userid").attr("required", "required");
                $("#password").attr("required", "required");

                $("#userid").removeAttr("disabled");
                $("#password").removeAttr("disabled");
            }

        });

    });

</script>
<h2>Configurations</h2>
<hr />
<div class="row">
    <div class="col-md-12">

        <h3><b>Set ConnectionString in Web.Config</b></h3>
        <p>
            You can use below form and save connectionstring in web.config.
            <br /><br />
        </p>
        @using (Html.BeginForm("EditConnectionString","ModalLogin"))
            {
            <div class="form-horizontal">

                @if (ViewBag.Result != null && string.IsNullOrEmpty(ViewBag.Result) == false)
                {
                    <div class="form-group">
                        <div class="col-md-12">
                            <div id="message" class="alert alert-@ViewBag.ResultStyle">
                                <table>
                                    <tr>
                                        <td><span class="glyphicon glyphicon-info-sign" style="font-size:larger;"></span></td>
                                        <td><div style="padding-left:20px;">@Html.Raw(ViewBag.Result)</div></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                }

                <div class="form-group">
                    <label class="control-label col-md-3">Server Name</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.TextBox("servername", (string)ViewBag.ServerName,
                                new { @class = "form-control", placeholder = "server name", required = "required" })
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Database Name</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.TextBox("databasename", (string)ViewBag.DatabaseName,
                                new { @class = "form-control", placeholder = "database name", required = "required" })
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Is Windows Authentication</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.CheckBox("iswinauthentication", (bool)ViewBag.IsWinAuthentication)
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">User Id</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.TextBox("userid", (string)ViewBag.UserId,
                                new { @class = "form-control", placeholder = "user id" })
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.Password("password", (string)ViewBag.Password,
                                new { @class = "form-control", placeholder = "password" })
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-9 col-md-push-3">
                        <div class="col-md-6">
                            <input type="submit" value="Update" class="btn btn-success" />
                            <br /><br />
                        </div>
                    </div>
                </div>
            </div>
        }
        <br /><br />
        <hr />

        <h3><b>Set AppSettings in Web.Config</b></h3>
        <p>
            You can use below form and save mail settings in web.config.
            <br /><br />
        </p>
        @using (Html.BeginForm("EditMailSettings","ModalLogin"))
            {
            <div class="form-horizontal">

                @if (ViewBag.MailResult != null && string.IsNullOrEmpty(ViewBag.MailResult) == false)
                {
                    <div class="form-group">
                        <div class="col-md-12">
                            <div id="message" class="alert alert-@ViewBag.MailResultStyle">
                                <table>
                                    <tr>
                                        <td><span class="glyphicon glyphicon-info-sign" style="font-size:larger;"></span></td>
                                        <td><div style="padding-left:20px;">@Html.Raw(ViewBag.MailResult)</div></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                }

                <div class="form-group">
                    <label class="control-label col-md-3">Mail Host</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.TextBox("mailhost", (string)ViewBag.MailHost,
                                new { @class = "form-control", placeholder = "mail host", required = "required" })
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Mail Port</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.TextBox("mailport", (string)ViewBag.MailPort,
                                new { @class = "form-control", type="number", placeholder = "port", required = "required" })
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Mail Username</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.TextBox("mailuid", (string)ViewBag.MailUid,
                                new { @class = "form-control", placeholder = "mail username" })
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Mail Password</label>
                    <div class="col-md-9">
                        <div class="col-md-6">
                            @Html.Password("mailpass", (string)ViewBag.MailPass,
                                new { @class = "form-control", placeholder = "mail password" })
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-9 col-md-push-3">
                        <div class="col-md-6">
                            <input type="submit" value="Update" class="btn btn-success" />
                            <br /><br />
                        </div>
                    </div>
                </div>
            </div>
        }
        <br /><br />
        <hr />

        <h3><b>Test User Information</b></h3>
        <p>
            You can use this sample account. This account will be automatically to insert SQL database with EF CodeFirst if you use Entity Framework.<br />
            <i>
                If you should see this code which is into SampleDatabaseContext file on Models folder.
            </i>
            <br /><br />
        </p>
        <p>
            <b>Username :</b> muratbaseren<br />
            <b>Password :</b> 123<br />
            <b>E-Mail   :</b> kadirmuratbaseren@gmail.com
        </p>
        <br /><br />
        <hr />


        <h3><b>Entity Framework &amp; Web.Config Configuration</b></h3>
        <p>
            You can install Entity Framework from nuget package manager for sample Index page.<br />
            <i>You should remove errors when EF installed</i>
        </p>
        <p class="alert alert-danger">
            <b>You don't forget! For EF run, it required connection string in web.config file. You can add below line to connectionStrings section in web.config</b>
        </p>
        <p>
            <pre style='color:#000000;background:#ffffff;'><span style='color:#a65700; '>&lt;</span><span style='color:#5f5035; '>connectionStrings</span><span style='color:#a65700; '>></span>
            <span style='color:#696969; '>&lt;!--</span><span style='color:#696969; '> With Windows Authentication </span><span style='color:#696969; '>--></span>
            <span style='color:#a65700; '>&lt;</span><span style='color:#5f5035; '>add</span> 
            <span style='color:#274796; '>name</span><span style='color:#808030; '>=</span><span style='color:#800000; '>"</span><span style='color:#0000e6; '>SampleDatabaseContext</span><span style='color:#800000; '>"</span> 
            <span style='color:#274796; '>providerName</span><span style='color:#808030; '>=</span><span style='color:#800000; '>"</span><span style='color:#0000e6; '>System.Data.SqlClient</span><span style='color:#800000; '>"</span> 
            <span style='color:#274796; '>connectionString</span><span style='color:#808030; '>=</span><span style='color:#800000; '>"</span><span style='color:#0000e6; '>Server=@ViewBag.ServerName;Database=@ViewBag.DatabaseName;Trusted_Connection=true;</span><span style='color:#800000; '>"</span> <span style='color:#a65700; '>/></span>
  
<span style='color:#a65700; '>&lt;/</span><span style='color:#5f5035; '>connectionStrings</span><span style='color:#a65700; '>></span>
</pre>
            <br />
            <b>   - OR -</b>
            <br /><br />
            <pre style='color:#000000;background:#ffffff;'><span style='color:#a65700; '>&lt;</span><span style='color:#5f5035; '>connectionStrings</span><span style='color:#a65700; '>></span>
            <span style='color:#696969; '>&lt;!--</span><span style='color:#696969; '> With SQL Authentication </span><span style='color:#696969; '>--></span>
            <span style='color:#a65700; '>&lt;</span><span style='color:#5f5035; '>add</span> 
            <span style='color:#274796; '>name</span><span style='color:#808030; '>=</span><span style='color:#800000; '>"</span><span style='color:#0000e6; '>SampleDatabaseContext</span><span style='color:#800000; '>"</span> 
            <span style='color:#274796; '>providerName</span><span style='color:#808030; '>=</span><span style='color:#800000; '>"</span><span style='color:#0000e6; '>System.Data.SqlClient</span><span style='color:#800000; '>"</span> 
            <span style='color:#274796; '>connectionString</span><span style='color:#808030; '>=</span><span style='color:#800000; '>"</span><span style='color:#0000e6; '>Server=@ViewBag.ServerName;Database=@ViewBag.DatabaseName;User Id=@(((string)ViewBag.UserId).ChangeEmptyString("[UserId]"));Password=@(((string)ViewBag.Password).ChangeEmptyString("[Password]"))</span><span style='color:#800000; '>"</span> <span style='color:#a65700; '>/></span>
  
<span style='color:#a65700; '>&lt;/</span><span style='color:#5f5035; '>connectionStrings</span><span style='color:#a65700; '>></span>
</pre>
        </p>
        <br /><br />

    </div>
</div>
