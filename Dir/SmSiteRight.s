<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY SiteRight "
declare @user_yn tinyint, @user_name char(30), @user_lst varchar(4000), @i int, @c int
select @user_yn = user_yn, @user_name = rtrim(name) from @@sysDatabaseName..userinfo2 where id = @user_id

if @user_yn = 1 begin
  exec @@sysDatabaseName..MaxvOnline$System$UpdateSiteRights @user_name, @ma_kho, @@appDatabaseName, @@sysDatabaseName
end
else begin
  select @user_lst = ltrim(rtrim(user_lst)) from @@sysDatabaseName..userinfo2 where id = @user_id
  select @i = 0, @c = dbo.ff_GetWordCount(@user_lst)
  while @i &lt; @c begin
    set @i = @i + 1
    set @user_name = ltrim(rtrim(dbo.ff_GetWordNum(@user_lst, @i)))
    if @user_name &lt;&gt; '' begin
      exec @@sysDatabaseName..MaxvOnline$System$UpdateSiteRights @user_name, @ma_kho, @@appDatabaseName, @@sysDatabaseName
    end
  end
end
">
]>

<dir table="syssiterights2" code="user_id, ma_kho" order="user_id, ma_kho" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="quyền truy cập theo kho" e="Site Access Right"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+N7IcRi9Pfx4b7C21PS3uA0PcMzvtOh3EANWonIndLF66uer50IAzImJLvQxY+vnQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="false" hidden="false" clientDefault="0" readOnly="false" allowContain="true" inactivate="true">
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="@@admin = 1 and status = '1'" check="@@admin = 1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="comment" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
    </field>
    <field name="id" external="true" defaultValue="''" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="11010011: [name].Label, [name], [ten_nsd%l], [id], [comment]"/>
      <item value="1101001: [ma_kho].Label, [ma_kho], [ten_kho%l], [user_id]"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7b5p03eoBE3KSCgdyocF11lq7+p4zT2Q9Hh2KhSdTFwSeP+kqctC2ZewJ1DrhE0FWQ1XyEHwmPYotwLnL1CKXD4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UY8bKp41zo6ShAUfkYpG/yqwUB+eptsA231tupw4XKG8c8+/qR5T4JQJLSTmxkiSDrptZaDZf3et8k0WhTQ1ws=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>an3g22eB2JUTSkqcS0BrqddbGvQzfZdRS3R7kS/zsoxUuRkW3mskGZgDeMzJ3MAMnYckeLwVOn5rxXgHFlR361nb8K2kUYVTVSWaZbp7n904cuWOoIJuY+u+33Av/zZtzCyzSvRZorBeFsWGEAcZ0Mi1GbWg4z+bUom889dxI3T+m9XK8mPwLebHdmX3ofRrx8oIgWflOtK6N/Uwdy8MKR5UU/RFA+k++r3ChAgujsAK9U3OAZJBtGzbB2XzvzaLkFVugZKLl/sebGyczV70L9HG0X5h7CN458avNKjYhu+/jm6AcAnPDhOSfjRhadyU0lVugs2Xjp167HyOjwvMzDolhUBbUeVSEl0sSIqZhCBPYUket/23J1UpgZhXST7x9TcQNCZVSalsvV3Y9gIXfVTYO9Wr+E9iqfIk3//eknc=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>8eME44tFrqOHrqAmwDMWHSL7GMXJMEt9VsNTOs9H+X8K/Jlkc6EVbRDxJnb+p8hun9On5wOr7KZPZGPJwd6N3mLwUMteIoILTBKgnSMOpJUO2OZZUaRb0yHlmkE8/7g2lF99XNYBQ1JJGypt99haoMWDp3nuQwYooMvwBmAO3NLW8N43S3ngxL1pxvdb5G5/uOzx5V0ZjylhG0wnmx5ig9sgHM5n9YnpReT4seCNS0GwPxj/4FyTF105k9dqlNTWvk5LBEmKT6yc2fkThXTdY4fF03jsFt8s/O0nQQxu3BPriRZcVnGnnmf4zDwJLbCz</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>po9vxNfoYyOuglIFQDISa+R8rCb12BviZ63TNhZ5Xs8buedvYW8IYDx2uzfyA8M6ZRel5kk5jfT0zK/MAD63qA8uMyVQoumVTA5r+Li5kRoG0kFeyW0kO0KSeQTr/UbQL/GtvL1xdAbQf9qCv3YMAVKNKKug89nsV2yOWcpTAY2/9E6BAirxRXseR/kwSXcoHjMCSOZrt6/H+crcwpl/7wHnBJnD8SHaHjqlzGMnc2Q=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &SiteRight;
        <![CDATA[<encrypted>nwimUMFOGx77qKGfW33yhRYhkX5q1fVdv/iHkKxs5FGmOZyeTwK6eu5Q0XXecPMG60+U99B4MrgocOpkvLmNLNsukMSv8uPwhPaAHr526NuPuARs2oi4iX2NRfwWLqjllnUFW7kYVw2pRFnkcpC22fWMf5JDU+U0vFCWBKudp1Zh1fgNUV+hLMyHK1kSS3hdLDnfngQJKMX0Xzn6fvpPCA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        &SiteRight;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>B8KYbvdPALRRkE9QeoS3mq6rXH8p+f9AK5H9Dr7+MTnT2/RTbao/K+3YWsg5QS/a2qyU/X/oDbrvBb/kqkSYTwampWeuyyKUmICDRFSAUXw6jgm8RmByPyd5nCkCdXeVY8MuNcCEMW2+IY/aXFBE7Eme2cInIsoXVHK0dOPIBnU2f9MOjWBFot+rF7EpfBppIaB3OaXWv51+NRfmnzS0kTdZyaxnFeR2izKot6SlOPtFMY9pAIVGMAtrePAWCbJd+TX2LSB74vvJBbxsMSzGUxhUmauC+P2LmoiCDc1ilWUEvjIeoGfgmI/tW68AKUbtmNK3rpgOTzV48LC65RN1s95SP+1ZiWBLQQak0wsTWwmkyQsrVzW1PXdQOSJbzyJlKbTf23wfRCDPwSXAiKHjjQavK+zzQg1P+kswSuIpmNYRD7KTCPFR0nl2pGi7J2KfHFhqVP1c3cFMbFNoX8kdy8FiFJG6C3G0XKyYdmbk4MbYb8w6lBctOsPSGO0sADzt</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>xPFga6R833jmeP7WS4tjePUDhiJQH+//I9/9fYFj1Zs8ROtIxetU1Vm6HW6LWwGz5nO89Nq5QMwrjuOPLJzZtlzvqGszDzqvoJOM4GthWVaZDwCjN1MPD/7C7gGEGRxLWn2P0b5WLIhWux9TMxMe0B0DxKUVjRZgTJqkfxP9ec6WkJOF6m595g/h6QkqdTlxl+LSEklQxOK2hBGCFH84a98f33JjwB1glzDfTVvWwcKNTuwrecZaDpEXpQ7TOyeX</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
