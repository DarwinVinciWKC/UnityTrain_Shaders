Shader "UnityTrain/VF3" {
    SubShader {

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            //函数可以有返回值，但是需要有相应的语义标识返回值
            //语义输出必须唯一，这里如果在片元着色器中使用原始模型的顶点位置，那么可以使用其他语义代替，
            //这里的语义并不改变数据的类型
            float4 vert(in float2 objPos : POSITION, out float2 oPos : TEXCOORD0, out float4 pos : POSITION) : COLOR {
                pos = float4(objPos, 0, 1);
                oPos = objPos;
                return pos;
            }

            fixed4 frag(in float4 col : COLOR, in float2 oPos : TEXCOORD0) : COLOR {
                col = float4(oPos, 0, 1);
                return col;
            }
            ENDCG
        }
    }
}