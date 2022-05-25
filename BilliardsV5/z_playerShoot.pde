PVector mouseStart, mouseEnd, velocity;
boolean hasPressed;
float rotationPressed;
float testVelocity;
float tVelbegin, tVel;
float angle;

PVector beginPressed, endPressed;
PVector newVel;

PVector finalVelocity = new PVector(0, 0);
PVector distanceCalculation = new PVector(0, 0);

void playerShoot() { // We will get back to the shooting code, don't worry about this; Edit: We're back, time to deal with this mess
  
  pushMatrix();
  translate(pb.getX(), pb.getY());
  rotate(atan2(mouseY - pb.getY(), mouseX - pb.getX()) * int(!hasPressed));
  rotate(rotationPressed * int(hasPressed));
  translate(20 + finalVelocity.y, -6); // Incorporate length of mouse dragged
  if (abs(pb.getVelocityX()) < 1 && abs(pb.getVelocityY()) < 1) image(stick, 0, 0);
  popMatrix();
}

void mousePressed() { // Rotate origin, mouseDragged ignoring Y changes, only X. Take X change, rotate back, and then apply velocity
  if (gameState == PLAYERSHOOT) {
    /*
    if (!hasPressed) {
      hasPressed = true; // Vx = V * cos(angle), Vy = V * sin(angle)
      rotationPressed = atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x);
      pushMatrix();
      translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
      rotate(rotationPressed);
      tVelbegin = mouseX - myBalls.get(0).pos.x;
      popMatrix();
    }
    */
    
    // Future velocity idea?
    // Get cue rotation
    // Get mouse coordinates
    // Convert to radial coords, rotate by cue rotation, then convert back to cardinal and get mouseX
    // Once mouse is released, do the same and compare X distance
    // Convert finalVelocity cue rotation (.x), and X distance (.y), and convert to Cardinal in order to apply velocity.
    
    /*
    finalVelocity.x = atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x); // Step 1: Get cue rotation
    distanceCalculation = new PVector(pow(mouseX - myBalls.get(0).pos.x, 2) + pow(mouseY - myBalls.get(0).pos.y, 2), atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x)); 
    // Step 2: Save location relative to ball, convert cardinal to polar
    distanceCalculation.y += finalVelocity.x; // Step 3: rotate according to angle
    */
    
    beginPressed = new PVector(mouseX, mouseY);
  }
}

// Main issue is, I need to get mouseX relative to ROTATED ball

void mouseReleased() {
  if (gameState == PLAYERSHOOT) {
    
    /*
    
    pushMatrix();
    translate(myBalls.get(0).pos.x, myBalls.get(0).pos.y);
    rotate(rotationPressed);
    tVel = abs(mouseX - myBalls.get(0).pos.x - tVelbegin);
    popMatrix();
    
    velocity = new PVector(tVel * cos(-rotationPressed), tVel * sin(-rotationPressed)); 
    //velocity = new PVector(velocity.x * cos(rotationPressed) - velocity.y * sin(rotationPressed), velocity.y * cos(rotationPressed) + velocity.x * sin(rotationPressed)); 
    // Vector rotation newX = x*cos(theta) - y*sin(theta), newY = y*cos(theta) + x*sin(theta)
    
    velocity.setMag(min(tVel, 40)); 
    velocity.x *= -1;
    myBalls.get(0).vel = velocity;

    hasPressed = false;
    gameState = CALCULATE;
    
    */
    
    
    /*
    // New NEW testing May 10
    endPressed = new PVector(mouseX, mouseY);
    newVel = beginPressed.sub(endPressed);
    newVel.setMag(100);
    pb.setVelocity(newVel.x, newVel.y);
    */
    
    
    // finalVelocity = new PVector(pow(mouseX - myBalls.get(0).pos.x, 2) + pow(mouseY - myBalls.get(0).pos.y, 2) - distanceCalculation.x, atan2(mouseY - myBalls.get(0).pos.y, mouseX - myBalls.get(0).pos.x));
    
    
    //pb.setVelocity(finalVelocity.y * cos(finalVelocity.x), finalVelocity.y * sin(finalVelocity.x)); // Last step: Convert polar coordinates to velocity
    
    pb.setVelocity(10, 10);
  }
}
