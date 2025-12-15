
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_1 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_2 ?v6 - type_3 ?v2 - type_2)
        (pred_5 ?v6 - type_4 ?v2 - type_1)
        (pred_3 ?v6 - type_4)
        (pred_4 ?v6 - type_2 ?v2 - type_2)
          (pred_1 ?v3 - type_4 ?v1 - type_2)   
    )

    (:action op_1
     :parameters (?v3 - type_4 ?v7 - type_1 ?v5 - type_2)
     :precondition (and (pred_2 ?v7 ?v5) (pred_2 ?v3 ?v5) (pred_3 ?v3))
     :effect (and
        (not (pred_2 ?v7 ?v5))
        (not (pred_3 ?v3))
        (pred_5 ?v3 ?v7))
    )

    (:action op_3
     :parameters (?v3 - type_4 ?v7 - type_1 ?v5 - type_2)
     :precondition (and (pred_2 ?v3 ?v5) (pred_5 ?v3 ?v7))
     :effect (and
        (pred_3 ?v3)
        (not (pred_5 ?v3 ?v7))
        (pred_2 ?v7 ?v5))
    )

    (:action op_2
     :parameters (?v3 - type_4 ?v8 - type_2 ?v4 - type_2)
     :precondition (and (pred_4 ?v8 ?v4) (pred_2 ?v3 ?v8) (not (= ?v8 ?v4)))
     :effect (and
        (not (pred_2 ?v3 ?v8))
        (pred_2 ?v3 ?v4)
        (pred_1 ?v3 ?v8))
        )
        
    )
)
