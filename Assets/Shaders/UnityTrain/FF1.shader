Shader "UnityTrain/FF1" {
    Properties {
        _Color ("Main Color", Color) = (1, 1, 1, 1)
        _Ambient ("Ambient", Color) = (0.3, 0.3, 0.3, 0.3)
        _Specular ("Specular", Color) = (1, 1, 1, 1)
        _Shininess ("Shininess", Range(0, 8)) = 4
        _Emission ("Emission", Color) = (1, 1, 1, 1)
        _MainTex ("MainTex", 2D) = ""
        _SecondTex ("SecondTex", 2D) = ""
    }
    SubShader {
        Pass {
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
        }
    }
}