// errorMiddleware.js

const errorHandler = (err, req, res, next) => {
    // Log the error for debugging purposes
    console.error(err.stack);

    // Default status code and message
    let statusCode = 500;
    let message = 'Internal Server Error';

    // Check for specific error types
    if (err.statusCode) {
        statusCode = err.statusCode;
        message = err.message || 'Error';
    } else if (err.name === 'ValidationError') {
        statusCode = 400;
        message = err.message || 'Validation Error';
    } else if (err.name === 'UnauthorizedError') {
        statusCode = 401;
        message = 'Unauthorized';
    } else if (err.name === 'NotFound') {
        statusCode = 404;
        message = 'Not Found';
    }

    // Set the response body
    const responseBody = {
        error: {
            message: message
        }
    };

    // Send the response
    res.status(statusCode).json(responseBody);
};

export default errorHandler
