
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_4 - object
        type_2 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_3 ?v7 - type_4 ?v8 - type_3)
        (pred_4 ?v7 - type_1 ?v8 - type_2)
        (pred_5 ?v7 - type_1)
        (pred_2 ?v7 - type_3 ?v8 - type_3)
          (pred_1 ?v3 - type_1 ?v2 - type_3)   
    )

    (:action op_1
     :parameters (?v3 - type_1 ?v5 - type_2 ?v4 - type_3)
     :precondition (and (pred_3 ?v5 ?v4) (pred_3 ?v3 ?v4) (pred_5 ?v3))
     :effect (and
        (not (pred_3 ?v5 ?v4))
        (not (pred_5 ?v3))
        (pred_4 ?v3 ?v5))
    )

    (:action op_3
     :parameters (?v3 - type_1 ?v5 - type_2 ?v4 - type_3)
     :precondition (and (pred_3 ?v3 ?v4) (pred_4 ?v3 ?v5))
     :effect (and
        (pred_5 ?v3)
        (not (pred_4 ?v3 ?v5))
        (pred_3 ?v5 ?v4))
    )

    (:action op_2
     :parameters (?v3 - type_1 ?v6 - type_3 ?v1 - type_3)
     :precondition (and (pred_2 ?v6 ?v1) (pred_3 ?v3 ?v6) (not (= ?v6 ?v1)))
     :effect (and
        (not (pred_3 ?v3 ?v6))
        (pred_3 ?v3 ?v1)
        (pred_1 ?v3 ?v6))
        )
        
    )
)
