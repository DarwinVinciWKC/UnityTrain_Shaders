Shader "UnityTrain/VF5" {
    Properties {
        _MainColor ("Main Color", COLOR) = (0, 0, 1, 1)
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            //https://github.com/DarwinVinciWKC/builtin_shaders-2021.3.4f1/blob/main/CGIncludes/UnityCG.cginc
            //Unity封装了三个用作输入的结构体，每个结构体分别提供了程序的输入数据
            float4 _MainColor;
            //uniform也可不写
            uniform float4 _SecondColor;
            void vert(in float2 objPos : POSITION, out float4 col : COLOR, out float4 pos : POSITION) {
                pos = float4(objPos, 0, 1);
                col = pos;
            }

            fixed4 frag(in float4 col : COLOR) : COLOR {
                //return _MainColor * _SecondColor;
                return lerp(_MainColor, _SecondColor, 0.5);
            }
            ENDCG
        }
    }
}