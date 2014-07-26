module Handler.Budget where
import Import
import Data.Text(Text, pack)

-- read input from Handler.Home form
-- send output to be rendered by  Handler.Home.updateBudget

-- Unlike Handler.Home, our this handler method returns a Value result, which is the datatype
-- used for JSON values. We return our result as a JSON object, and place
-- our result under the "value" key.
putBudgetR :: Handler Value
putBudgetR = do
    -- Look up the post parameter containing the input Markdown.
    minput <- lookupPostParam "budget"
    return $ object
                ["budgetOutput" .= maybe defaultBudget computeBudget minput ]


type BudgetOutput = Text

-- TODO implement!
-- for now, just echo the input back
computeBudget :: Text -> BudgetOutput 
computeBudget input = input


defaultBudget :: BudgetOutput
defaultBudget = pack "Default"