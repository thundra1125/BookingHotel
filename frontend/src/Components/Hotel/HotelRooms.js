import React from "react";
import RoomCard from "../Global/RoomCard";

function HotelRooms({ hotel, type }) {
  return (
    <section className="my-8 md:px-16 xl:px-24">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 ">
        {hotel && type === "common"
          ? Object.values(hotel.rooms).map((room) => {
              return <RoomCard key={room.id} room={room} />;
            })
          : Object.values(hotel.rooms)
              .filter((room) => !room.booked)
              .map((room) => {
                return <RoomCard key={room.id} room={room} />;
              })}
      </div>
    </section>
  );
}

export default HotelRooms;
