using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MVPTransform : MonoBehaviour
{
    Matrix4x4 mvp;
    new Renderer renderer;
    Matrix4x4 RM = new Matrix4x4();
    Matrix4x4 SM = new Matrix4x4();
    void Update()
    {
        RM[0, 0] = Mathf.Cos(Time.realtimeSinceStartup);
        RM[0, 2] = Mathf.Sin(Time.realtimeSinceStartup);
        RM[1, 1] = 1;
        RM[2, 0] = -Mathf.Sin(Time.realtimeSinceStartup);
        RM[2, 2] = Mathf.Cos(Time.realtimeSinceStartup);
        RM[3, 3] = 1;

        SM[0, 0] = Mathf.Sin(Time.realtimeSinceStartup);
        SM[1, 1] = Mathf.Cos(Time.realtimeSinceStartup);
        SM[2, 2] = Mathf.Sin(Time.realtimeSinceStartup);
        SM[3, 3] = 1;

        mvp = Camera.main.projectionMatrix * Camera.main.worldToCameraMatrix * transform.localToWorldMatrix * RM;
        renderer = GetComponent<Renderer>();
        //renderer.material.SetMatrix("mvp", mvp);
        renderer.material.SetMatrix("mvp", mvp * SM);
    }
}
