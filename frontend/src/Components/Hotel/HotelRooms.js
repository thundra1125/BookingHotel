import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import RoomCard from "../Global/RoomCard";
import Pagination from "../Global/Pagination";

function HotelRooms({ hotel }) {
  const state = useSelector((state) => state);

  const dispatch = useDispatch();
  useEffect(() => {
    console.log("mouse========", state);
  }, []);
  return (
    <section className="my-8 md:px-16 xl:px-24">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 ">
        {hotel &&
          hotel.rooms.map((room) => {
            return <RoomCard key={room.id} room={room} />;
          })}

        {state.hotels.pagination.last_page !== 1 && (
          <Pagination
            paginate={state.hotels}
            // method={getAllRooms}
            params={[dispatch, state.auth.token]}
          />
        )}
      </div>
    </section>
  );
}

export default HotelRooms;
