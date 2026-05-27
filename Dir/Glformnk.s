<?xml version="1.0" encoding="utf-8"?>

<dir table="v30dmsnk15" code="ma_snk" order="ma_snk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tham số" e="Parameter"></title>
  <fields>
    <field name="ma_snk" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label0&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label0&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du01">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label1&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label1&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du02">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label2&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label2&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du03">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label3&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label3&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du04">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label4&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label4&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_loaitru">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label5&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label5&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="title">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s/Tiêu đề 1, 2" e="%s Account/Title 1, 2"></footer>
    </field>
    <field name="title2">
      <header v="" e=""></header>
    </field>
    <field name="title01">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 1/Tiêu đề 1, 2" e="%s Account 1/Title 1, 2"></footer>
    </field>
    <field name="title012">
      <header v="" e=""></header>
    </field>
    <field name="title02">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 2/Tiêu đề 1, 2" e="%s Account 2/Title 1, 2"></footer>
    </field>
    <field name="title022">
      <header v="" e=""></header>
    </field>
    <field name="title03">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 3/Tiêu đề 1, 2" e="%s Account 3/Title 1, 2"></footer>
    </field>
    <field name="title032">
      <header v="" e=""></header>
    </field>
    <field name="title04">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 4/Tiêu đề 1, 2" e="%s Account 4/Title 1, 2"></footer>
    </field>
    <field name="title042">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s loại trừ" e="%s Accounts Excluded"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="180, 130, 150, 130, 0"/>
      <item value="11111: [tk].Description, [tk], [title], [title2], [ma_snk]"/>
      <item value="1111: [tk_du01].Description, [tk_du01], [title01], [title012]"/>
      <item value="1111: [tk_du02].Description, [tk_du02], [title02], [title022]"/>
      <item value="1111: [tk_du03].Description, [tk_du03], [title03], [title032]"/>
      <item value="1111: [tk_du04].Description, [tk_du04], [title04], [title042]"/>
      <item value="1100: [tk_loaitru].Description, [tk_loaitru]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>yAhlfaaWq8JYm2riOYDZ90Pt6qsFUUtdvj6xbZsMa0/IPpRJ870mSoFr0vAGKYjHiQoXEJFVrRwxSFGYES99pvAQ20fmOPWgMOrZU6c71SQMKo3/wmS3lvZtDNgvXV3A9JQiVZ0kPheC3/G+hcsdDeN410Pd9J7LuTT3MBQWW+OmIEORbWaA0xnUrn2W3lL2eVu7LKFkwKs7zGuJmPTa9wFhrRW5MvWcNoswf0H3IAk7QxNRhO6y0sXXlxhBGQy+yfCsxvbzHOW5Hh6Fu5at6g==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>h22GX5wF4m/KZ/ybfc/L/FYtOop1glbw4vyNMVdvLX0/rh39UeLMDZcbYX/kvHIoLCOQVmmPFRt8ZkqNEuIkNrj4zqTpRG5hr/tLCfeYfHBsleilGbXzpNMbJMfNw3KcxFRcoYsELYIDSF+grcT98/5QqjMkXUHSsZn6tyq0y4tVLizOloHqCiLUeoze1s+tnYq0sEvH+1I6MLqLLyvYa5vS60h2KXJWjZTSKB82xieR3GQE27vCc6QFqwhjBE1lXfSAy8GndMqaWKglkDMJRRNdBSIOuIHhO7/x6eQhY+ek0VtRCRL/99FbyFdpZdpXW5l6iUqwwmNaSid4nhmRQquI7RcWha6xv+fgwiJdw42/h7/O4kr2xZDJzV4jSytWhZbUYtyFVR9zGfknCh/rFtanh1sZgKQz2bIJDU9A/AoSQiYnwNSooH88ThC9rrq1YYglYcnlNohylhcW2fY6sZ9dUR65NRiV9PmvkpFwPzglFYfFLzZpuziCcCpm5/48</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>pMvRCSGR/7A3FruRB6UZrwuyg3DJIpzOJ6F8mWoO1pgEIXylOnvLaSR/zwY2oHb2WuljIEF5jeYtLnRoaUtvAXpjy8BYaWjNn3mwmYEdvA6NPVmtUobqyqepqSekltlqnKGMK+q3d9CEpJRdu6lXm9cfM6pI+dtcIOEL49l61WozF37IAdCIaJUQkxd6Pcr2TPHutQMP60EMdiWCeNFjGfbYANCwK2VnBjMGgHXrN2Y=</encrypted>]]>
    </text>
  </css>
</dir>
