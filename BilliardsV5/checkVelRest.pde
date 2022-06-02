ArrayList<FBody> fBodyList;
float totalVelocity = 0;

float checkVelRest() {
  totalVelocity = 0;
  fBodyList = world.getBodies();
  for(int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    totalVelocity += abs(fb.getVelocityX()) + abs(fb.getVelocityY());
  }
  return totalVelocity;
}

/*
void calmVel() {
  fBodyList = world.getBodies();
  for(int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    fb.setVelocity(fb.getVelocityX() * 0.99, fb.getVelocityX() * 0.99);
  }
}
*/
