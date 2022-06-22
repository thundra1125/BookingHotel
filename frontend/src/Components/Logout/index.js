import React, { useEffect } from "react";
import { useHistory } from "react-router-dom";
import SecureLS from "secure-ls";

function Logout() {
  let ls = new SecureLS({ encodingType: "aes", isCompression: false });

  useEffect(() => {
    console.log("ls===", ls);
    ls.remove("token");
    ls.remove("user_id");
    ls.remove("is_admin");
    ls.remove("user_image");
    return () => {
      ls.remove("token");
      ls.remove("user_id");
      ls.remove("is_admin");
      ls.remove("user_image");
    };
  }, []); // eslint-disable-line

  let history = useHistory();
  setTimeout(() => {
    history.push("/");
  }, 3000);
  return <div></div>;
}

export default Logout;
