;#############################
;######## TEMPLATES ##########                           
;#############################

(deftemplate person
    (slot name)
    (slot age (type INTEGER))
    (slot gender (allowed-symbols male female other))
    (multislot children)
)

;#############################
;######## FACTS  #############                           
;#############################

(deffacts init
    (person (name pam)
            (age 69)
            (gender female)
            (children bob maks)
    )
    (person (name tom)
            (age 68)
            (gender male)
            (children bob maks liv)
    )
    (person (name bob)
            (age 45)
            (gender male)
            (children pat ann)
    )
    (person (name maks)
            (age 35)
            (gender male)
            (children)
    )
    (person (name liv)
            (age 26)
            (gender female)
            (children)
    )
    (person (name pat)
            (age 21)
            (gender female)
            (children jim)
    )
    (person (name ann)
            (age 15)
            (gender female)
            (children)
    )
    (person (name jim)
            (age 2)
            (gender male)
            (children)
    )
)

;#############################
;######## RULES  #############                           
;#############################

(defrule count-children 
    (person (name ?name) (children $?children))
    (test (> (length$ ?children) 0)) ;to print only the people with more than 0 children
    =>
    (bind ?number (length$ ?children))
    (printout t ?name " Has " ?number " Childs." crlf)
)
;-------------------------------------------------------------------------------------------------
(defrule mother
    (person (name ?name) (gender female) (children $?children))
    (test (neq ?children "")) ;second way to check if children is empty or not
    =>
    (printout t ?name " is a mother." crlf)
)
;-------------------------------------------------------------------------------------------------
(defrule father
    (person (name ?name) (gender male) (children $?children))
    (test (neq ?children "")) ;second way to check if children is empty or not
    =>
    (printout t ?name " is a father." crlf)
)
;-------------------------------------------------------------------------------------------------
(defrule first-child
  (person (name ?name) (children $?children&:(> (length$ ?children) 0))) ;third way to check num of childs
  =>
  (bind ?firstChild (nth$ 1 ?children))
  (printout t "First child of " ?name " is " ?firstChild "." crlf)
)
;-------------------------------------------------------------------------------------------------
(defrule no-child
    (person (name ?name) (children $?children&:(> (length$ ?children) 0)))
    =>
    (printout t ?name " has no child." crlf)

)
;-------------------------------------------------------------------------------------------------