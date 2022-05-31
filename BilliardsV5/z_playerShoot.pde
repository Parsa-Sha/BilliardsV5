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

void playerShoot() { // We will get back to the shooting code, don't worry about this;
  if (velcel) {
    velcel = false;
    mousePressed = false;
  }
  if (mousePressed) {
    pushMatrix();
    translate(pb.getX(), pb.getY());
    rotate(atan2(mouseY - beginPressed.y, mouseX - beginPressed.x) * int(!hasPressed));
    rotate(rotationPressed * int(hasPressed));
    translate(20 + map(dist(beginPressed.x, beginPressed.y, mouseX, mouseY), 0, 100, 0, 10), -6); // Incorporate length of mouse dragged
    if (abs(pb.getVelocityX()) < 0.1 && abs(pb.getVelocityY()) < 0.1) image(stick, 0, 0);
    popMatrix();
  }

  stroke(1);
  noFill();
  if (abs(pb.getVelocityX()) < 0.1 && abs(pb.getVelocityY()) < 0.1) ellipse(30, 30, 26, 26);
  
  for (int i = 0; i < myBalls.size(); i++) {
    for (int j = 0; j < myBalls.size(); j++) {
      if (i != j) {
        Ball b1 = world.getBodies().get(i));
        Ball b2 = world.getBodies().get(j));
      }
    }
  }
}

void mousePressed() { // Rotate origin, mouseDragged ignoring Y changes, only X. Take X change, rotate back, and then apply velocity
  if (gameState == PLAYERSHOOT) {
    if (abs(pb.getVelocityX()) < 0.1 && abs(pb.getVelocityY()) < 0.1) beginPressed = new PVector(mouseX, mouseY);
  }
}

void mouseReleased() {
  if (gameState == PLAYERSHOOT) {
    if (abs(pb.getVelocityX()) < 0.1 && abs(pb.getVelocityY()) < 0.1) endPressed = new PVector(mouseX, mouseY);
    newVel = beginPressed.sub(endPressed);

    if (pb.getVelocityX() < 0.1 && pb.getVelocityY() < 0.1) pb.setVelocity(newVel.x, newVel.y);
  }
}
