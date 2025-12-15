
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_1 - object
        type_3 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_2 ?v6 - type_1 ?v1 - type_2)
        (pred_1 ?v6 - type_4 ?v1 - type_3)
        (pred_3 ?v6 - type_4)
        (pred_4 ?v6 - type_2 ?v1 - type_2)
          (pred_5 ?v4 - type_4 ?v8 - type_2)   
    )

    (:action op_3
     :parameters (?v4 - type_4 ?v5 - type_3 ?v3 - type_2)
     :precondition (and (pred_2 ?v5 ?v3) (pred_2 ?v4 ?v3) (pred_3 ?v4))
     :effect (and
        (not (pred_2 ?v5 ?v3))
        (not (pred_3 ?v4))
        (pred_1 ?v4 ?v5))
    )

    (:action op_1
     :parameters (?v4 - type_4 ?v5 - type_3 ?v3 - type_2)
     :precondition (and (pred_2 ?v4 ?v3) (pred_1 ?v4 ?v5))
     :effect (and
        (pred_3 ?v4)
        (not (pred_1 ?v4 ?v5))
        (pred_2 ?v5 ?v3))
    )

    (:action op_2
     :parameters (?v4 - type_4 ?v7 - type_2 ?v2 - type_2)
     :precondition (and (pred_4 ?v7 ?v2) (pred_2 ?v4 ?v7) (not (= ?v7 ?v2)))
     :effect (and
        (not (pred_2 ?v4 ?v7))
        (pred_2 ?v4 ?v2)
        (pred_5 ?v4 ?v7))
        )
        
    )
)
