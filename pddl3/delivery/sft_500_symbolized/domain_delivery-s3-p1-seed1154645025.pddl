
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_3 - type_1
        type_2 - type_1
    )

    (:predicates
        (pred_3 ?v2 - type_1 ?v8 - type_4)
        (pred_4 ?v2 - type_2 ?v8 - type_3)
        (pred_2 ?v2 - type_2)
        (pred_5 ?v2 - type_4 ?v8 - type_4)
          (pred_1 ?v4 - type_2 ?v3 - type_4)   
    )

    (:action op_2
     :parameters (?v4 - type_2 ?v7 - type_3 ?v5 - type_4)
     :precondition (and (pred_3 ?v7 ?v5) (pred_3 ?v4 ?v5) (pred_2 ?v4))
     :effect (and
        (not (pred_3 ?v7 ?v5))
        (not (pred_2 ?v4))
        (pred_4 ?v4 ?v7))
    )

    (:action op_3
     :parameters (?v4 - type_2 ?v7 - type_3 ?v5 - type_4)
     :precondition (and (pred_3 ?v4 ?v5) (pred_4 ?v4 ?v7))
     :effect (and
        (pred_2 ?v4)
        (not (pred_4 ?v4 ?v7))
        (pred_3 ?v7 ?v5))
    )

    (:action op_1
     :parameters (?v4 - type_2 ?v6 - type_4 ?v1 - type_4)
     :precondition (and (pred_5 ?v6 ?v1) (pred_3 ?v4 ?v6) (not (= ?v6 ?v1)))
     :effect (and
        (not (pred_3 ?v4 ?v6))
        (pred_3 ?v4 ?v1)
        (pred_1 ?v4 ?v6))
        )
        
    )
)
