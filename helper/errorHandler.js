const errorHandler = (res, data, type) => {
  if(data.err || data.errno){
    res.status(400).json({ status: 400, message: data });
  } else if(data.length === 0){
    res.status(404).json({ status: 404, message: "Not found" });
  } else{

    type==="post"? res.status(201).json({ status: 201, data: data }) : res.status(200).json({ status: 200, data: data });
  }
};

module.exports = {
  errorHandler,
};
