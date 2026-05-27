<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterAccess "(name in (select name from userinfo2 where id = @@userID) or (@@admin = 1))">
  
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
]>

<grid table="vsyslogs" code="id" order="date_time desc, id" database="Sys" filter="&FilterAccess;" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Nhật ký hệ thống" e="System Logs"></title>
  <subTitle v="Các thông tin thực hiện chức năng của người sử dụng." e="Detailed information about the user's activities."></subTitle>
  <fields>
    <field name="id" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="ID" e="ID"></header>
    </field>
    <field name="date_time" width="125" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" allowSorting="true">
      <header v="Thời gian" e="Time"></header>
    </field>
    <field name="hostname" width="150" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
    <field name="name" width="120" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="Name"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên người sử dụng" e="Full Name"></header>
    </field>
    <field name="content%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Hành động" e="Information"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="date_time"/>
      <field name="hostname"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="content%l"/>
    </view>
  </views>
  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7W/roIsjYL1OfHc14qPpHssA1xZVnlmY/m9lSnnIFNzkPGn5C6F+1cSdbJOKASYxWmfPRqwSAVp7f1IzohWMYo1b++I+5xD75R55bXN1tAKO</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Zi0ZLVoUp0YDaJoPvnLslnu4yb6h3WKLXHUydstrYUIU9x9fpbGTH30XHRfj3j3/fI/hqRF5BpQzjvCsS9BOzS+xI8aRCy5TWFizQrpL2R7yUHL3RbF2YUC7mvfWZLX7gissB4UvovlT4R/tw8RSQzpz0EILHKQtK4H4KEL9sfw=</encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>
  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
