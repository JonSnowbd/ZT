#version 330 core

layout (location = 0) in vec3 vertPos;
layout (location = 1) in vec4 vertCol;
layout (location = 2) in vec2 texPos;

out vec4 VertexColor;
out vec2 VertexTexPos;

void main()
{
    VertexTexPos = texPos;
    VertexColor = vertCol;
    gl_Position = vec4(vertPos, 1.0);
}