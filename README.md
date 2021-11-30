# Things I would have done if I knew RoR better

### Unit and functional tests
1. Test if we're able to create an entity class.
2. Test if we're unable to create an entity class if the name is incorrect.
3. Test if sending extra params to controller actions is properly handled.
4. Test if we can create entities, update and delete them.
5. With the help of fixtures, create many transactions to test:
   1. Sum
   2. Duplicate


### Validation
While I did create a custom way of validation order columns in the ApplicationController I still would have preferred to add more validation in the models.

### Logs
Custom logs to know for example when an error occurs with more information.
