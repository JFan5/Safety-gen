
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_1 - object
        type_4 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_3 ?v1 - type_1 ?v6 - type_2)
        (pred_4 ?v1 - type_3 ?v6 - type_4)
        (pred_2 ?v1 - type_3)
        (pred_5 ?v1 - type_2 ?v6 - type_2)
          (pred_1 ?v3 - type_3 ?v7 - type_2)   
    )

    (:action op_3
     :parameters (?v3 - type_3 ?v4 - type_4 ?v2 - type_2)
     :precondition (and (pred_3 ?v4 ?v2) (pred_3 ?v3 ?v2) (pred_2 ?v3))
     :effect (and
        (not (pred_3 ?v4 ?v2))
        (not (pred_2 ?v3))
        (pred_4 ?v3 ?v4))
    )

    (:action op_2
     :parameters (?v3 - type_3 ?v4 - type_4 ?v2 - type_2)
     :precondition (and (pred_3 ?v3 ?v2) (pred_4 ?v3 ?v4))
     :effect (and
        (pred_2 ?v3)
        (not (pred_4 ?v3 ?v4))
        (pred_3 ?v4 ?v2))
    )

    (:action op_1
     :parameters (?v3 - type_3 ?v5 - type_2 ?v8 - type_2)
     :precondition (and (pred_5 ?v5 ?v8) (pred_3 ?v3 ?v5) (not (= ?v5 ?v8)))
     :effect (and
        (not (pred_3 ?v3 ?v5))
        (pred_3 ?v3 ?v8)
        (pred_1 ?v3 ?v5))
        )
        
    )
)
