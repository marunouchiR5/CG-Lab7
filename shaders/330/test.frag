#version 330

uniform sampler2D myTexture;
uniform sampler2D myNormalMap;
uniform int useNormalMap;
uniform vec3 lightPosition;

in vec2 texCoord;
// in vec3 outPosition;
in vec3 outNormal;
// in vec3 outWorldPos;
// in vec3 outWorldNormal;

out vec4 outputColor; //this tells OpenGL that this variable is the output color

void main()
{
	vec4 texColor = texture(myTexture, texCoord.xy);

    // vec3 camPos = vec3(0.0, 0.0, 3.0);
    // vec3 wray = normalize(outWorldPos - camPos);

    // vec3 normal1 = myNormal;
    vec3 normal2 = vec3(1.0);

    if (useNormalMap == 0) {
        outputColor = texColor * dot(outNormal, lightPosition);
    } else {
        normal2 = texture(myNormalMap, texCoord.xy).rgb;
        normal2 = normalize(normal2 * 2.0 - 1.0);
        outputColor = texColor * dot(normal2, lightPosition) * dot(outNormal, lightPosition);
    }

    // float dot1 = 1;
    // // if (useNormalMap == 1) {
	//     dot1 = dot(normalize(normal2), normalize(lightPosition));
    // // }
    // float dot2 = dot(normalize(normal1), normalize(lightPosition));
    // float outputDiffuse = dot1 * dot2;

    // vec4 color = vec4(texColor.x, texColor.y, texColor.z, 1.0);
    
    // color *= outputDiffuse;
    // outputColor = color;


    
    
    //outputColor = vec4(texCoord.x, texCoord.y, 1.0, 1.0);
}
