$(function () {
    $("#txtsearch").keyup(function () {
        var search = $("#txtsearch").val();
        var SetData = $("#result");
        SetData.html("");
        $.ajax({
            url: "/Category/Search",
            data: { Name: search },
            contentType: "html",
            success: function (response) {
              

                $(response).each(function (i, e) {
                    var Data = "<tr>" +
                                  "<td>" + e.ID + "</td>" +
                                  "<td>" + e.Name + "</td>" +
                                  "<td><a href=/Category/Edit/"+e.ID+">Sửa</a></td>"+
                                  "<td><a href=/Category/Delete/" + e.ID + ">Xóa</a></td>" +
                                  "</tr>";
                    SetData.append(Data);
                });
             

            }
            


        });

    });


});