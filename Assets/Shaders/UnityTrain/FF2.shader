Shader "UnityTrain/FF2" {
    Properties {
        _Color ("Main Color", Color) = (1, 1, 1, 1)
        _Ambient ("Ambient", Color) = (0.3, 0.3, 0.3, 0.3)
        _Specular ("Specular", Color) = (1, 1, 1, 1)
        _Shininess ("Shininess", Range(0, 8)) = 4
        _Emission ("Emission", Color) = (1, 1, 1, 1)
        _MainTex ("MainTex", 2D) = "" { }
        _SecondTex ("SecondTex", 2D) = "" { }
        _Constant ("ConstantColor", Color) = (1, 1, 1, 0.3)
    }
    SubShader {
        Tags { "Queue" = "Transparent" }
        Pass {
            //源和目标混合，源：当前待渲染，目标：除源外已经渲染
            Blend SrcAlpha OneMinusSrcAlpha
            //Color(1, 1, 1, 1)
            //Color[_Color]
            Material {
                DIFFUSE[_Color]
                AMBIENT[_Ambient]
                SPECULAR[_Specular]
                SHININESS[_Shininess]
                EMISSION[_Emission]
            }
            Lighting On
            SeparateSpecular On
            //Primary 之前所有的计算过光照之后的顶点的颜色
            //Previous 之前所有计算和采样过后的结果
            SetTexture[_MainTex] {
                Combine texture * primary double
            }
            //可混合几张贴图根据GPU能力
            SetTexture[_SecondTex] {
                ConstantColor[_Constant]
                Combine texture * previous double, texture * constant //此处最后一个参数texture说明使用材质本身的透明通道，与constant的Alpha混合

            }
        }
    }
}