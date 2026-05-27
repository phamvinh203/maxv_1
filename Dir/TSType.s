<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmplcc" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="loại công cụ" e="Tool &#38; Supply Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" allowSorting="true">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_loai].Label, [ten_loai]"/>
      <item value="1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVFliyx83EU+BU5Wu22xeUrmAF8kGjhwPupA2oBxFUVgOUcW3u7FwSzkvG7SZtZgZmY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvDLhxaV5GpRrZq73DqXy01FyZBwBCdC6VNbvBsFVfV9hyCdJ3lc+pPlCK71j+o6eI0CDcNf+k6CC0i207XAJsc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>TllLxOywGidwPuoQnMBE5GwCqN/Rey8DM9F8Q6xNbwQIATjZC4BgU/E0Xekdu010iXHKeQAOHY33UZ3Drz9H7EQvJlsdbkPXaqCNI1tDLBEAJkNYAyH086tg8JphZqzXUKSCO6rhguFZjfkR3ir71Wr7J1wm3agRQZMbbUrx/BVlrumDsgDqurU6ITsG+g9aa8J2R5S/4Ps4E3PNMblOOTmDypro1q1/0ofkZe4KRTsSX06lxTTxUJz+hSkCoUdHIe13jKm1r0M4lDyARq45Ro9rOnTdzqB8S2s3rgAgSSkbxqutSFWOtWYq+Ej0++8P1BHbr6o2Zt75B5Fb7tTWElFXJOfFjNhVwjkIaiYNJGANh3fqOCRPHE6De4oFz3gxX/xGQVulKkoBtzNfE9gNnyXcXN1DBTT4OwqAwgnBZXomEGuFR5Jvnp2T9BIs0ta6JsSoygeATZbJeQGU/bRWrNwSkE7ETrK0ShhVwYzh3keg+GRw2VmZxqN7+dHYmA9irV9SFR13Zyzx/+8MazmThik/VK3Xlx1jiN9zMnmMjNnDl0bCefwJcLGUf4FJUmaW</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>aRp2UMpnHwesoqAVI37aHK9uPGKMSK+oRTwB541lLpSBRmcEMT4aWF8pFpffv+sz2uJD/MxrygLAOe0iLBuoQIQdcCSW9YkDbhwh6FH6M+zPuc36cn8SCizf7AwCO0gJ42c+zs2sEzEyI/fu5mjGoR8YwIoMiBE9IA34lZf1kdyvs4Q3bPjQP3NVPu/pV4+MmZf/7utJGK2hNcfVBSDOStyudTmV20LC7h9iXOk7skDfIeqN2kVxhk2wULDYx82H/uIFT9MxkkzU404kOtwyQg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>oaVPD2VRkBq+lPE33nEgbLq/S6bCDvN1WxljTntiHJUy4GNueFrz+KZUf9EnaoY31plKs042tdVgBcHI1p+Qu3Oma8pMGAr1zuPUOtg4ykr0aPmJVeuJkV8qUwL2AlQyqkvJ0oXqvLElGQkvz17GQrXAvXj5cm9oD13onp68dJXjxVyPoqXvx2/p1DGtws4tzWbrHfJvJPv+E5Ms/lF54M3H9lqZ1shpTzHWvbG2e4EKp56MKyY2lOlik3Ppp8swxUKpwz4coMDLvTbFA/xSYOkKzC4thUPB+MkSRCr82uefuFDyeE1kWlVvBaHp7RAZQ0STBEShQEpxvcHwAIGZqg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILdj6MneZsyPO6CzityBdRSuJr8c5EPPSN6IBGacGnplZ</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>qhZb6CvBmTjG8RvQwwnRxaBVfyC6IxBRZCG0I6HqnYCUMte04B2v+9NGNAQaGhJTcRHlYZTfd8MWjnA3DyOFQypIQLSPFxVDGD61x+CgzV5O8n8jaTXcvpwJqeQDazbYGqyWL1ay3afqC6d0+yWXfO4bhAkLT2WHU80DeKRfZD/JG6F2IhrJwW4A8FeEIvc5MC2T6nr0mbUXeOgNkauRJpeYfqn8Fx1++i+e/JPS+a/56K4WZpfNnLh5IvL13ZT8+sHLPS82IKVJToEm+Ww0/vOfHBpPncvvQkIFlNbEQjcM7d3n43N3qs3tbaAEWIR5DOlCJ9oO1hOgcS8ud2/6CTnK0X39uM3CcQ9oTms+vY8=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
