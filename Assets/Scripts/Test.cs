using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Test : MonoBehaviour
{
    // Start is called before the first frame update
    float a = 0.2123f;
    void Start()
    {
    }
    private void OnDrawGizmosSelected()
    {
        print(a % 2);
    }
    // Update is called once per frame
    void Update()
    {

    }
}
