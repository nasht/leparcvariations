String timestamp() {
  Date d = new Date();
  println(d.getTime());
  return "" + d.getTime();  
}

