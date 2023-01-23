class User {
    user_id;
    first_name;
    last_name;
    role;

    constructor(user_id, first_name, last_name, role) {
        this.user_id = user_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.role = role;
    }
}

export default User;