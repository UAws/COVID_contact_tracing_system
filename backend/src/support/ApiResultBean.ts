import {log} from "util";
import {Request} from "express";

export class ApiResultBean {


    private static serialVersionUID : number = -8276264968757808344 ;

    public static SUCCESS: number = 20000;

    private message : string = "Request SUCCESS";

    private code : number = ApiResultBean.SUCCESS;

    private data : Object;


    constructor(message: string, code: number, data: Object) {
        this.message = message;
        this.code = code;
        this.data = data
    }


    public static success(data?: Object, message?: string, code?: number): ApiResultBean {


        if (data != null && message != null && code != null) {
            return new ApiResultBean(message, code, data);
        }

        if (data != null && message != null) {
            return new ApiResultBean(message, this.SUCCESS, data);
        }

        if (data != null && code != null) {
            return new ApiResultBean("Request SUCCESS", code, data);
        }

        if (data != null) {
            return new ApiResultBean("Request SUCCESS", this.SUCCESS, data);
        }

        return new ApiResultBean("Request SUCCESS", this.SUCCESS, null);

    }

    public static error(
        request?: Request,
        error?: any ,
        message?: string | object
    ): ApiResultBean {

        if (request != null && error!= null) {
            const errObj = {
                errorServerInfo : {
                    method: request.method,
                    params : request.params,
                    body: request.body,
                    url : request.url
                },
                errorDatabaseInfo: error
            }

            if (error.stack) {
                errObj.errorDatabaseInfo = {message: error.message, stack: error.stack};
            }

            if (error.output) {
                return new ApiResultBean(error.output.payload.message, 20003, errObj);
            }

            if (message) {
                return new ApiResultBean(message.toString(), 20001, errObj);
            } else {
                return new ApiResultBean("Request ERROR", 20002, errObj);
            }


        }


    }

    public static errorMessage(message?: string
    ) {
        if (message) {
            return new ApiResultBean(message, 20002, {});
        } else {
            return new ApiResultBean("Request ERROR", 20003, "Internal Server Error");
        }
    }



}
