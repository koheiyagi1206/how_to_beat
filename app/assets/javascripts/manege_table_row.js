// Manage Row Table

function AddRow(add_type) {
  var add_target_row  = document.getElementById("add_target_row");
  var div_element     = document.createElement("div");

  // 追加タイプ分岐
  if (add_type == "add_text") {
    // テキスト追加
    var table_count = add_target_row.getElementsByTagName("table").length + 1;
    var table_html  = `
      <table class = "table table-borderless" style = "width: 100%;">
        <tbody>
          <tr>
            <td style = "width: 80%;"><textarea placeholder="text" style="width: 100%;" name="post[post_bodies_attributes][${table_count}][text]"></textarea></td>
            <td class = "align-middle" style = "width: 20%;"><input class = "btn btn-danger" type = "button" value = "Delete" onclick = "RemoveRow(this)"></td>
          </tr>
        </tbody>
      </table>
    `;

    div_element.className = "col-md-12";
    div_element.innerHTML = table_html;

    add_target_row.appendChild(div_element);
    console.log("Tableの個数：" + table_count);

  } else {
    // 画像追加
    var table_count = add_target_row.getElementsByTagName("table").length + 1;
    var table_html  = `
      <table class = "table table-borderless" style = "width: 100%;">
        <tbody>
          <tr>
            <td class = "align-middle" style = "width: 40%;"><input placeholder="image title" style="width: 100%;" type="text" name="post[post_bodies_attributes][${table_count}][image_title]"></td>
            <td class = "align-middle" style = "width: 40%;"><input accept="image/*" placeholder="image" type="file" name="post[post_bodies_attributes][${table_count}][image_body]"></td>
            <td class = "align-middle" style = "width: 20%;"><input class = "btn btn-danger" type = "button" value = "Delete" onclick = "RemoveRow(this)"></td>
          </tr>
        </tbody>
      </table>
    `;

    div_element.className = "col-md-12";
    div_element.innerHTML = table_html;

    add_target_row.appendChild(div_element);
    console.log("Tableの個数：" + table_count);

  }
}

function RemoveRow(pressed_button) {
  var target_table = pressed_button.closest("table");
  target_table.parentNode.removeChild(target_table);
}
