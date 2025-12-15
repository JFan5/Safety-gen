
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_1 - object
        type_3 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_5 ?v6 - type_1 ?v2 - type_2)
        (pred_2 ?v6 - type_4 ?v2 - type_3)
        (pred_3 ?v6 - type_4)
        (pred_4 ?v6 - type_2 ?v2 - type_2)
          (pred_1 ?v7 - type_4 ?v3 - type_2)   
    )

    (:action op_1
     :parameters (?v7 - type_4 ?v5 - type_3 ?v4 - type_2)
     :precondition (and (pred_5 ?v5 ?v4) (pred_5 ?v7 ?v4) (pred_3 ?v7))
     :effect (and
        (not (pred_5 ?v5 ?v4))
        (not (pred_3 ?v7))
        (pred_2 ?v7 ?v5))
    )

    (:action op_2
     :parameters (?v7 - type_4 ?v5 - type_3 ?v4 - type_2)
     :precondition (and (pred_5 ?v7 ?v4) (pred_2 ?v7 ?v5))
     :effect (and
        (pred_3 ?v7)
        (not (pred_2 ?v7 ?v5))
        (pred_5 ?v5 ?v4))
    )

    (:action op_3
     :parameters (?v7 - type_4 ?v8 - type_2 ?v1 - type_2)
     :precondition (and (pred_4 ?v8 ?v1) (pred_5 ?v7 ?v8) (not (= ?v8 ?v1)))
     :effect (and
        (not (pred_5 ?v7 ?v8))
        (pred_5 ?v7 ?v1)
        (pred_1 ?v7 ?v8))
        )
        
    )
)
