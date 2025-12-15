
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_1 ?v8 - type_2 ?v1 - type_4)
        (pred_2 ?v8 - type_1 ?v1 - type_3)
        (pred_4 ?v8 - type_1)
        (pred_3 ?v8 - type_4 ?v1 - type_4)
          (pred_5 ?v5 - type_1 ?v3 - type_4)   
    )

    (:action op_2
     :parameters (?v5 - type_1 ?v7 - type_3 ?v4 - type_4)
     :precondition (and (pred_1 ?v7 ?v4) (pred_1 ?v5 ?v4) (pred_4 ?v5))
     :effect (and
        (not (pred_1 ?v7 ?v4))
        (not (pred_4 ?v5))
        (pred_2 ?v5 ?v7))
    )

    (:action op_1
     :parameters (?v5 - type_1 ?v7 - type_3 ?v4 - type_4)
     :precondition (and (pred_1 ?v5 ?v4) (pred_2 ?v5 ?v7))
     :effect (and
        (pred_4 ?v5)
        (not (pred_2 ?v5 ?v7))
        (pred_1 ?v7 ?v4))
    )

    (:action op_3
     :parameters (?v5 - type_1 ?v6 - type_4 ?v2 - type_4)
     :precondition (and (pred_3 ?v6 ?v2) (pred_1 ?v5 ?v6) (not (= ?v6 ?v2)))
     :effect (and
        (not (pred_1 ?v5 ?v6))
        (pred_1 ?v5 ?v2)
        (pred_5 ?v5 ?v6))
        )
        
    )
)
