
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_1 - object
        type_4 - type_1
        type_2 - type_1
    )

    (:predicates
        (pred_5 ?v6 - type_1 ?v2 - type_3)
        (pred_3 ?v6 - type_2 ?v2 - type_4)
        (pred_1 ?v6 - type_2)
        (pred_4 ?v6 - type_3 ?v2 - type_3)
          (pred_2 ?v7 - type_2 ?v8 - type_3)   
    )

    (:action op_2
     :parameters (?v7 - type_2 ?v5 - type_4 ?v1 - type_3)
     :precondition (and (pred_5 ?v5 ?v1) (pred_5 ?v7 ?v1) (pred_1 ?v7))
     :effect (and
        (not (pred_5 ?v5 ?v1))
        (not (pred_1 ?v7))
        (pred_3 ?v7 ?v5))
    )

    (:action op_1
     :parameters (?v7 - type_2 ?v5 - type_4 ?v1 - type_3)
     :precondition (and (pred_5 ?v7 ?v1) (pred_3 ?v7 ?v5))
     :effect (and
        (pred_1 ?v7)
        (not (pred_3 ?v7 ?v5))
        (pred_5 ?v5 ?v1))
    )

    (:action op_3
     :parameters (?v7 - type_2 ?v3 - type_3 ?v4 - type_3)
     :precondition (and (pred_4 ?v3 ?v4) (pred_5 ?v7 ?v3) (not (= ?v3 ?v4)))
     :effect (and
        (not (pred_5 ?v7 ?v3))
        (pred_5 ?v7 ?v4)
        (pred_2 ?v7 ?v3))
        )
        
    )
)
