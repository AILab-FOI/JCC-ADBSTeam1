import { isNullOrUndefined } from "../Utils/Helper";

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

    static parseJSON(data){
        console.log(data);
        return new User(isNullOrUndefined(data.user_id),
        isNullOrUndefined(data.first_name),
        isNullOrUndefined(data.last_name),
        isNullOrUndefined(data.role));
    }
}

export default User;