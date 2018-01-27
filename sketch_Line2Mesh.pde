ArrayList<PVector> points;

void setup(){
  size(500, 500, P3D);
  
  points = new ArrayList<PVector>();
}

void draw(){
  lineTriangleMesh();
}

void lineTriangleMesh(){

  beginShape(TRIANGLE_STRIP);
  
  for(int i=0; i<points.size(); i++){
    
    // Getting starting point
    PVector p = points.get(i);
    
    // Get index before and after current index
    int i_m_1 = max(i-1, 0);
    int i_p_1 = min(i+1, i);
    
    // Get the point before and the point after starting point
    PVector min = points.get(i_m_1);
    PVector max = points.get(i_p_1);
    
    // Find the mid-point in the segment
    PVector add = PVector.add(max, min);
    PVector div = PVector.div(add, 2);
    
    // Get the differece between two points, which allows us to calculate the angle
    PVector diff = PVector.sub(max, min);
    
    // Normalize vector (sets to numbers between -1, 1)
    diff.normalize();
    // Scale vector
    diff.mult(25);
    // Rotate vector by desired angle - also try PI/4 - 45 degrees
    diff.rotate(PI/2.5);
    
    // Add first vertex
    vertex(div.x + diff.x, diff.y + div.y);
    
    // Rotate again by 180 degrees
    diff.rotate(PI);
    
    // Add second vertex
    vertex(div.x + diff.x, diff.y + div.y);
  }
  endShape();
}

void mouseDragged(){
  points.add(new PVector(mouseX, mouseY));
}