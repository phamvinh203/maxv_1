<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
]>

<grid table="dmkc" code="stt_rec" order="stt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bút toán kết chuyển tự động" e="Closing Transaction"></title>
  <subTitle v="Từ kỳ %s1 đến kỳ %s2 năm %s3." e="Period from %s1 to %s2 year %s3."></subTitle>
  <partition table="dmkc" prime="dmkc" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag" readOnly="false">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="100" allowFilter="true" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="loai_kc" type="Decimal" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại kc" e="Closing Type"></header>
    </field>
    <field name="tk_no" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="loai_kc"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksHDWCkHEtt+iNpyzh+LEKBKdSHSq2KxZh+kM06qUrCjf0VOcf5QGfSwrPTfWxXDu/kuR50cuFvCXRk3YVxuVus=</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjsTx4aoKFC/0LzfM++Agf3Fpu6I4lq+rJk2T/lWJ989igNkrtMHCGTP0xuDcKUyOpwzZw+5PofBKEnfxnInsRo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>jMenRoYbMGnrAIm9PfqZrpi6wxy3Zs0Dtuq8PU0Z5IGvqfQfC1rqP7LJfIPwIbftXm0+GPxs/TxIqWZhEOdBVBzhjr7vmeg/84yVDwlFurK1YJg71gnUOd5yNAh3dGj3E+k/nnyPGfTJWyN2AA0I/lgEjcv9g8nwXbL18MUncOHA/fbIwMrXkGqbkGX1MJGLnQYY6RtCdv/Vj9raPqhNCEsYjc5Yj+4Ys1khPNmkBHw3JsCONOv4b0hgaA1I4uPf51TU7f3RBosQlOCJAuuKdXwUe0geQGFJZzTIEnx9ZrIqk124e8B5U9HeGebWDFk54Kg9u8OqO10p4fwOPnP4j8LsmmRskHMncKSr+xZD/E+qcE1sG+G68FFgi3y/b4DvHrSqZUw2+JcuxaA3ucVw3dsQnvmZhLEM9Oxu9a1otJ2Fa2rY36sfYDjPeRkxKUp/IeyIJgR37EfQJPaQ3XFg6tFCutjYra1STnDW/cgNaUeIVPNAR6J/HzvXaik38aLKix3OYtegyG0GB5Jx6x/Nl6UxM1yN5OharqxO8MwoTAHdNEmqIUR0bNWjlgr7xbOl1R+Cgo08FWqujX8Mn1O+QRh6nMCXWHXZm2Z1rdiuS6X8ivTv4JmNxVXfRp1KZ1QZnEtu+XHoPa1pKn7WUNzqGYWQF5udXOZkMTat16vV9CUJY8Vb1ppjVGOgWBCzm1pm23NznSKydr1BVGKMPdLe/zuFuPDRP982KPQHlaE8mfHOMlZrSIaZlY3hKKnXLyqCPH6qHBkScuQv6DyJ0taMY68K5Or8K1Vox3BOzXAylSNWWc2hpOEnxJBPsXVvLQE61sqGrENx1pDxc0t3/EBY9SV9D4VdqWY5i/T87GhNh9lfTqBNcEE/l4KEL8B4Pk9p9G5IryMMvfqgOcW2cM0IdfHCDGWkClE2V5G4cyx/vQJafV+7kjQPc1o3AZORsUOn9nNFyQ+V2Hns6nHC8jKcj/2ZudyivT86RQyMawlGwc8sUw0N5t6BCoylo5NVO24evJJksbZ3MvY2xumlKbAZTGBnlhyNbFVhnyWpHQ9UJbwfJkTgH5RMZspoDGJDBctlyQEzjWeIikleLvwXCFd4+GZqHErQsP3AMSBdJrFm5z3cgtvWPGdX3nm5vfmliC7Dbn7XhOEg3dSVntdP4aAXLzbAbyEDGj3o/Cv9eDOvVJpcyesgWwRgfjAWw755JwGzhxK4hSjQp3Ngs+kXYfOVZQweCKA0icNEB0WRmSLky+CR/e47Y4IuIoq1QIbnfomNjlWCT7+6MV7A7iT7nX5h1luO0JHVBLPg/QjvSiaeFrDQhvHHRxG35n8FhJ2LZoNWL0S+1Tb0ScLY/GzAMbulZxiYs3b0LqFjt/8eGcekKhbks2nIjZiUZap4g76B35aYTkVg5tsONqIuHu/VTUbFucIWMonpXIvPj//w1GwMInybeOlWqMiIJiGeneDWJfbFhO+zpG5dpp4/sEama06P4lREZIdeACcSCcLm7BlGE3Nnj5dG1Aap0z/GbITQyCaEzZiwDO/1GfokNY6LkGK2+X21OXv+gwAQR6xhDn9KqIcz91y+KLO4fYUhlH+sBGYDG9+pkgAruFfCYAgdFDwfrLWefS4mV0iWsEhxnAv3dzPq9ITnddTpqp+XJNd7ZO5HEqWEvkbr28T0QiThxPxlm+ewneIabqeJacB4fhgvhLJDl5I/zYTl339fhDeJRDe5z/sSfP+2KGOYdySmEgMSyYuZ+hj9Nf3hdWTrOrnReUAn+/WBmqoI9mVx5f1OD62tanY80sMv/pNua59eZGtp9JJIIVhO8gXYg0Tpu8+uBpQ=</encrypted>]]>
     
    </text>
  </script>

  <response>
    <action id="Create">
      <text>
        <![CDATA[<encrypted>UsdKljWcySk8PbqRCVuWrXIrvuyeiop0biZ88OR1CbgsUwQeQWtKvo9aNsf5hbvWOyDMvw/jDjhEKR9aHWbctkM0XWovqw7h/aWMeLTOXwjpn7/E2E7bIRJZrdHE5THYW7nd59LYePJbZg9MxPES56Bw2K0R5AJum0NMjL0nQBF5t6L/Nv7yA2FU2I193E/AKmwcTqEKqUFYUEgTwJM+gliMjwOnVsFtexZCHRBAOUkVa2XZXF5f4reYgcX9rJ7f</encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<encrypted>622rx06hmMPweyI8I89SBMwt8ifR1OXxId/FnlwcW3G77mp0qzK9ksPqzMDHOIGWRtk22oC9dY0H+vgxnqVWvRLd9vrwbxQpM/TYuODWwFEZiy0+0WL0VtwlzHY+eEN4bXni2D3dcutmf69yA7K0lNGUkPkRUBkalq0eyx0/thGh2GleK4yaaqi55FNTOiDtnFwNZSljiySs6/Ai+Y3ZE6GX7HJLl9XV7YiOgVudxxlcAsCo3bgDKHfHoV9L7Bav</encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38Flktlvv/hBphTYlxk1PoS6qFFGHbHdvzlf+PUai1eINKPW14rN3yApxaw14jUx4wAGMcI02+w4UoOQXTsdhhB5iCZODquyHz3iKvQ6GA6IIAaToq7AyfKENm1+1Kz0WXOpEtvCebQSSNGytxAQh9tolk2ppwldqC2MeSHnW08cERO</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Create">
      <title v="Kết chuyển" e="Create Closing Transaction"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa kết chuyển" e="Delete"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ" e="Filter"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
