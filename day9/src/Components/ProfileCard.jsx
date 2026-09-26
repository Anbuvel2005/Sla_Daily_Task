function ProfileCard() {
  return (
    <div className="mx-auto mt-10 w-80 rounded-xl bg-white p-6 text-center shadow-lg">
      {/* Profile Image */}
      <img
        src="https://i.pravatar.cc/150?img=12"
        alt="Profile"
        className="mx-auto h-28 w-28 rounded-full object-cover"
      />

      {/* Name */}
      <h2 className="mt-4 text-2xl font-bold text-gray-800">Anbuvel</h2>

      {/* Job Title */}
      <p className="mt-1 text-blue-600">Full Stack Developer</p>

      {/* Short Description */}
      <p className="mt-3 text-gray-600">
        Passionate developer who enjoys building modern and user-friendly web
        applications.
      </p>

      {/* Follow Button */}
      <button className="mt-5 rounded-lg bg-blue-600 px-6 py-2 font-semibold text-white hover:bg-blue-700">
        Follow
      </button>
    </div>
  );
}

export default ProfileCard;
