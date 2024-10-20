public void CGLine(float x1, float y1, float x2, float y2) {
    // TODO HW1
    // You need to implement the "line algorithm" in this section.
    // You can use the function line(x1, y1, x2, y2); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    // For instance: drawPoint(114, 514, color(0, 0, 0)); signifies drawing a red
    // point at (114, 514).

    /*
     stroke(0);
     noFill();
     line(x1,y1,x2,y2);
    */
    
    int x0 = Math.round(x1);
    int y0 = Math.round(y1);
    int xEnd = Math.round(x2);
    int yEnd = Math.round(y2);

    int dx = Math.abs(xEnd - x0);
    int dy = Math.abs(yEnd - y0);
    
    int sx = x0 < xEnd ? 1 : -1;
    int sy = y0 < yEnd ? 1 : -1;
    
    int err = dx - dy;
    
    while (true) {
      drawPoint(x0, y0, color(0, 0, 0));
        
      if (x0 == xEnd && y0 == yEnd) break;
        
      int e2 = 2 * err;
      if (e2 > -dy) {
          err -= dy;
          x0 += sx;
      }
      if (e2 < dx) {
        err += dx;
        y0 += sy;
      }
    }
}

public void CGCircle(float x, float y, float r) {
    // TODO HW1
    // You need to implement the "circle algorithm" in this section.
    // You can use the function circle(x, y, r); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    circle(x,y,r*2);
    */

    int xc = Math.round(x);
    int yc = Math.round(y);
    int radius = Math.round(r);
    
    int x0 = 0;
    int y0 = radius;
    int d = 1 - radius;

    drawPoint(xc + x0, yc + y0, color(0, 0, 0));
    drawPoint(xc - x0, yc + y0, color(0, 0, 0));
    drawPoint(xc + x0, yc - y0, color(0, 0, 0));
    drawPoint(xc - x0, yc - y0, color(0, 0, 0));
    drawPoint(xc + y0, yc + x0, color(0, 0, 0));
    drawPoint(xc - y0, yc + x0, color(0, 0, 0));
    drawPoint(xc + y0, yc - x0, color(0, 0, 0));
    drawPoint(xc - y0, yc - x0, color(0, 0, 0));

    while (x0 < y0) {
      if (d < 0) 
        d += 2 * x0 + 3;
      else {
        d += 2 * (x0 - y0) + 5;
        y0--;
      }
      x0++;
      drawPoint(xc + x0, yc + y0, color(0, 0, 0));
      drawPoint(xc - x0, yc + y0, color(0, 0, 0));
      drawPoint(xc + x0, yc - y0, color(0, 0, 0));
      drawPoint(xc - x0, yc - y0, color(0, 0, 0));
      drawPoint(xc + y0, yc + x0, color(0, 0, 0));
      drawPoint(xc - y0, yc + x0, color(0, 0, 0));
      drawPoint(xc + y0, yc - x0, color(0, 0, 0));
      drawPoint(xc - y0, yc - x0, color(0, 0, 0));
    }
}

public void CGEllipse(float x, float y, float r1, float r2) {
    // TODO HW1
    // You need to implement the "ellipse algorithm" in this section.
    // You can use the function ellipse(x, y, r1,r2); to verify the correct answer.
    // However, remember to comment out the function before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    ellipse(x,y,r1*2,r2*2);
    */

    int xc = Math.round(x);
    int yc = Math.round(y);
    int rx = Math.round(r1);
    int ry = Math.round(r2);

    float dx, dy, d1, d2, x0, y0;
    x0 = 0;
    y0 = ry;

    // Region 1
    d1 = (ry * ry) - (rx * rx * ry) + (0.25f * rx * rx);
    dx = 2 * ry * ry * x0;
    dy = 2 * rx * rx * y0;

    while (dx < dy) {
      drawPoint(xc + Math.round(x0), yc + Math.round(y0), color(0, 0, 0));
      drawPoint(xc - Math.round(x0), yc + Math.round(y0), color(0, 0, 0));
      drawPoint(xc + Math.round(x0), yc - Math.round(y0), color(0, 0, 0));
      drawPoint(xc - Math.round(x0), yc - Math.round(y0), color(0, 0, 0));

      if (d1 < 0) {
        x0++;
        dx += 2 * ry * ry;
        d1 += dx + (ry * ry);
      }
      else {
        x0++;
        y0--;
        dx += 2 * ry * ry;
        dy -= 2 * rx * rx;
        d1 += dx - dy + (ry * ry);
      }
    }

    // Region 2
    d2 = ((ry * ry) * ((x0 + 0.5f) * (x0 + 0.5f))) + ((rx * rx) * ((y0 - 1) * (y0 - 1))) - (rx * rx * ry * ry);

    while (y0 >= 0) {
      drawPoint(xc + Math.round(x0), yc + Math.round(y0), color(0, 0, 0));
      drawPoint(xc - Math.round(x0), yc + Math.round(y0), color(0, 0, 0));
      drawPoint(xc + Math.round(x0), yc - Math.round(y0), color(0, 0, 0));
      drawPoint(xc - Math.round(x0), yc - Math.round(y0), color(0, 0, 0));

      if (d2 > 0) {
        y0--;
        dy -= 2 * rx * rx;
        d2 += (rx * rx) - dy;
      }
      else {
        x0++;
        y0--;
        dx += 2 * ry * ry;
        dy -= 2 * rx * rx;
        d2 += dx - dy + (rx * rx);
      }
    }
}


public void CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // TODO HW1
    // You need to implement the "bezier curve algorithm" in this section.
    // You can use the function bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x,
    // p4.y); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    bezier(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y,p4.x,p4.y);
    */
    float step = 0.00001f;
    for (float t = 0; t <= 1; t += step) {
        float x = (1 - t) * (1 - t) * (1 - t) * p1.x + 3 * (1 - t) * (1 - t) * t * p2.x + 3 * (1 - t) * t * t * p3.x + t * t * t * p4.x;
        float y = (1 - t) * (1 - t) * (1 - t) * p1.y + 3 * (1 - t) * (1 - t) * t * p2.y + 3 * (1 - t) * t * t * p3.y + t * t * t * p4.y;
        drawPoint(x, y, color(0, 0, 0));
    }
}

public void CGEraser(Vector3 p1, Vector3 p2) {
    // TODO HW1
    // You need to erase the scene in the area defined by points p1 and p2 in this
    // section.
    // p1 ------
    // |       |
    // |       |
    // ------ p2
    // The background color is color(250);
    // You can use the mouse wheel to change the eraser range.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    
    int xStart = Math.min(Math.round(p1.x), Math.round(p2.x));
    int xEnd = Math.max(Math.round(p1.x), Math.round(p2.x));
    int yStart = Math.min(Math.round(p1.y), Math.round(p2.y));
    int yEnd = Math.max(Math.round(p1.y), Math.round(p2.y));

    for (int x = xStart; x <= xEnd; x++) {
        for (int y = yStart; y <= yEnd; y++) {
            drawPoint(x, y, color(250));
        }
    }
}

public void drawPoint(float x, float y, color c) {
    stroke(c);
    point(x, y);
}

public float distance(Vector3 a, Vector3 b) {
    Vector3 c = a.sub(b);
    return sqrt(Vector3.dot(c, c));
}
