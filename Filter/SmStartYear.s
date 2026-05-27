<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Khai báo ngày bắt đầu nhập liệu" e="Declare Beginning Input Date"></title>
  <fields>
    <field name="ngay_ky1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110--: [ngay_ky1].Label, [ngay_ky1]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>oaVPD2VRkBq+lPE33nEgbFBEnrTMav8mY7nlNa/dX7vsoBbHElpesb3hDvqnxm82gdgyumJSZUKBQrCh3qjhYarfvZLDqWF83ImveqakhACLB78Kpy9bRchexL+/NPMNFbq+B2lATMX976UfH5W8/xkbe19fhvqN+2V1pW7GSOMP41QhOTPqbhsc9pb2NXDjFn5+JaXeYuhkmm1If0yG44g7iquNT27v37wQh9hLc4SJHh06DmVoAXux3kYYtIXjplS2Uq3iqUyYjTqrG5bnhTW3/l5MWn1R4Ix+ZFOULvI9cf4HbVsqakQt6wi5Nx+C23i1cp25qDkDq8tuvc2Cf3C9uEYN1nNpxxeyugprydvp1eCK9XP+OUzs7gK+P4KT</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBQjCob56tsBoSd8E3/pKx4/SCVZOUWtC2jRKR0vdxrEBza7yPKq++CFHrB24OaCskGWo8jKkzAZKUxsLFWsUBkE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Zi0ZLVoUp0YDaJoPvnLslou4oo6Qh1VAbUKNdGc4kB7y5ZS37kwCYJwVJydLKw7yDnBTaP4gc8RztJ9VQZ7L0A/0ViGNSHuse2gMQFSAXQZf9eU9hlkKKG1H05qeK712GmNzOdNEO93toFxqwluaTyX/eedgtZiDKhriZ5EjJ3s=</encrypted>]]>
    </text>
  </script>
</dir>
