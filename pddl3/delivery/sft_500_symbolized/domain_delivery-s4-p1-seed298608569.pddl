
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_4 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_4 ?v6 - type_3 ?v1 - type_1)
        (pred_3 ?v6 - type_2 ?v1 - type_4)
        (pred_2 ?v6 - type_2)
        (pred_5 ?v6 - type_1 ?v1 - type_1)
          (pred_1 ?v3 - type_2 ?v4 - type_1)   
    )

    (:action op_1
     :parameters (?v3 - type_2 ?v2 - type_4 ?v8 - type_1)
     :precondition (and (pred_4 ?v2 ?v8) (pred_4 ?v3 ?v8) (pred_2 ?v3))
     :effect (and
        (not (pred_4 ?v2 ?v8))
        (not (pred_2 ?v3))
        (pred_3 ?v3 ?v2))
    )

    (:action op_3
     :parameters (?v3 - type_2 ?v2 - type_4 ?v8 - type_1)
     :precondition (and (pred_4 ?v3 ?v8) (pred_3 ?v3 ?v2))
     :effect (and
        (pred_2 ?v3)
        (not (pred_3 ?v3 ?v2))
        (pred_4 ?v2 ?v8))
    )

    (:action op_2
     :parameters (?v3 - type_2 ?v5 - type_1 ?v7 - type_1)
     :precondition (and (pred_5 ?v5 ?v7) (pred_4 ?v3 ?v5) (not (= ?v5 ?v7)))
     :effect (and
        (not (pred_4 ?v3 ?v5))
        (pred_4 ?v3 ?v7)
        (pred_1 ?v3 ?v5))
        )
        
    )
)
