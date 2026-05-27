<?xml version="1.0" encoding="utf-8"?>
<dir table="xdmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="công đoạn" e="Section"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã công đoạn" e="Section"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="truc_tiep" type="Boolean" clientDefault="true" defaultValue="true">
      <header v="Trực tiếp" e="Direct"></header>
    </field>
    <field name="ma_bp0">
      <header v="Công đoạn trước" e="Prev. Section"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp0%l" key="status = '1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 330"/>
      <item value="1101: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11: [truc_tiep].Label, [truc_tiep]"/>
      <item value="1101: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>3XkovI8YwnxgFGTUd3voED8Fg1qgpCEqhOyG++dkWirtNpsTi5x5NPBWusvYu3sX/S7UjU8LjcnSe04oBGZ5ESf77EHyD4v3Yevb2+BJ1Ct1SsvaMpVbGjIlcg1ZMHmVC+sRfAaN9gswxr2x2LEHnbAglP2zrH6SRoEb9EGSPQi2EeMar9yT1Lt03hxAGtigTImbQvBYqPeMR/doLnM4yk12nGZHKVtwQzvh7VxA62aOb1t3zWWvWvcNpsso6U+R5bQnfxJLruZ2xd4NIRPIBqznYb/RC67AdgAIiOtmmQkXLAdS+hPcRGawZVlXGgFARcphAjjGPXJl4h84Gm3igBsiEviC9f3ewhweOwo4VxZ/15Bishn8B0ysU3K3xs79vYT7iVnMoEzqXX/ZwuDli5ool9wRifeluefQcBH7YRqYF0kCg0FJEP8N7E+8gYfFC2twMBQ9zMxH0rhngBaZpjkRvtOocedQ++KP6kykVdUwKyri9s5cpp2phUB5LMinbK1fNaOi8ek/S8Jjs9P7cZS5rQtc+qL/d1FmacPmORg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>kHxGHIqdhTz6a3dFePPlHuUCB8Sf5YYlY/GaLZmOHog4pn5RctXQZxpDz+LmVhv1hF0WD3ks/cjySAhrWFuMgZxawGHN7SWaYdfk5xdOMUuZ1UlFuydtqW5ZtyUfXKeLdrHfd1aNIBGogl/eSH+b/ocvAw8/QlUNt4/MEZ+l7ACds9d+cz3lGLyXfPqdhJrstaTHQWqbKmUX5XnpazTdRrI0RV1M1lak0uXSXfAjupBe+rK5lpJNtC1E+BuLt5RUR/nkRYIkwvF7g9QpFR6EKtQ/ve3xwuz5vJv12RNpZEHSNN0qfr7Cc+8eH/ntFEb2SXHIb6h1XnoqKTNNJDxx4A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBd+/74qkPbCv4C+nYH6iu8oqdALCjWLtwuQaWNq5Ub4cFTg3e0RTkRZpb/u8rxE9FKp8a+E4L8PLmK+ffHAdgXU=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0Qtr/ywmF6d8/jJ4D9TPbVWbmIyd+SO5qMZN1R9HhXE+ay+o6ktXduD8x7Y1jT7QWta+a57CuPXKqOg1t8nAo9NCYGkPAxDddXpU0gp14H6cSnXn2eENfa2ct8dREl7DuzpzC+v99HcCaeozbkOF/0X5Jzbj9DK15floFUAQVPsXwGUQzfCRcn3Okf/U0ZthmCRsSPc+XK7i3yNRoZ88tk8L+rkW7e4UrR9411VY/QkrkzxKmNIF2TXCI23ybOjay/HI7vN3q7Lt8bNBLC59rjCyZD2+K0YEpo5rfYE34eBGZ</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>KKawOVwdndAMgY/1MU0jYDBW92Y0OxdbMXx6Onw7zDi4PZoj5kzTkvjPao6d1bVjZJ+zGst8NQAEN8/NpJJjC4FAMAxWmYSwP7jzyesZPw61AM8QWYZYpocYH6dKR1oIIMO5gTD2OsMO/fa1YSohnq6JxUbSfCimMmxOKwCqup51TmMkQd6zVJpd3bcQkBEx6loO+g8C9s+ZJ13O+MLtQrbxbfjJbaD2PuBlq6+QscU=</encrypted>]]>
      </text>
    </command>

  </commands>
</dir>
