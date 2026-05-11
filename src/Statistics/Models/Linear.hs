{- HLINT ignore "Use camelCase" -}
module Statistics.Models.Linear(linear_model, fit, predict_linear) where
import Statistics.Vector.Operations(vs_mult, vs_add, v_mult, v_sub)
import Statistics.Models.Loss(mse)

-- Linear Regression Models 
linear_model :: Double -> Double -> [Double] -> [Double]
linear_model w b x = 
    let
        wx = vs_mult x w 
        wbx = vs_add wx b
    in wbx 

-- Compute the weights gradient 
grad_w :: [Double] -> [Double] -> [Double] -> Double
grad_w x y y_hat = 
    let
        term_1 = -(2 / fromIntegral (length x))
        sum_residuals = sum (v_mult x (v_sub y y_hat))
        gradient = term_1 * sum_residuals
    in gradient

-- Compute the bias gradient
grad_b :: [Double] -> [Double] -> Double
grad_b y y_hat =
    let
        term_1 = -(2 / fromIntegral (length y))
        sum_residuals = sum (v_sub y y_hat)
        gradient = term_1 * sum_residuals
    in gradient

-- Gradient Decent Step
gd_step ::Double -> Double -> Double -> [Double] -> [Double] -> (Double, Double)
gd_step w b alpha x y =
    let
        predictions = linear_model w b x
        gradient_w  = grad_w x y predictions
        gradient_b  = grad_b y predictions 
        w_new = w - alpha * gradient_w
        b_new = b - alpha * gradient_b
        return_new = (w_new, b_new)
    in return_new

-- Gradient Decent Train Loop 
train :: Double -> Double -> Double -> Double -> Int -> [Double] -> [Double] -> (Double, Double)
train w b alpha epsilon iters x y =
    if iters == 0
    then
        (w, b)
    else
        let
            -- Check old predictions
            old_predictions = linear_model w b x
            old_loss = mse y old_predictions

            -- Take a Step 
            (w_new, b_new) = gd_step w b alpha x y

            -- Generate new predictions
            new_predictions = linear_model w_new b_new x
            new_loss = mse y new_predictions

            -- Generate new w b 
            w_diff = abs (w_new - w)
            b_diff = abs (b_new - b)

            -- Divergent check block
            explosion_limit = 1e10

            exploded =
                abs w_new > explosion_limit ||
                abs b_new > explosion_limit

            invalid =
                isNaN w_new || isNaN b_new ||
                isInfinite w_new || isInfinite b_new

            -- Compare the previus loss to the new one 
            worse_loss = new_loss > old_loss

        in
            if exploded || invalid || worse_loss
            then
                (w, b)

            else if w_diff < epsilon && b_diff < epsilon
            then
                (w_new, b_new)

            else
                -- Recursion start again 
                train w_new b_new alpha epsilon (iters - 1) x y

-- Custom Return Type 
data LinearModel = LinearModel
    { slope     :: Double
    , intercept :: Double
    } deriving Show

-- Function to fit the model
fit :: Double -> Double -> Int -> [Double] -> [Double] -> LinearModel
fit alpha epsilon iters x y =
    let
        (w_final, b_final) = train 0 0 alpha epsilon iters x y
    in
        LinearModel w_final b_final

-- Function to Predict with fitted model 
predict_linear :: LinearModel -> [Double] -> [Double]
predict_linear (LinearModel w b) x =  linear_model w b x