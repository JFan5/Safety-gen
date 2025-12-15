
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_4 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_4 ?v8 - type_3 ?v5 - type_1)
        (pred_2 ?v8 - type_2 ?v5 - type_4)
        (pred_5 ?v8 - type_2)
        (pred_3 ?v8 - type_1 ?v5 - type_1)
          (pred_1 ?v3 - type_2 ?v4 - type_1)   
    )

    (:action op_1
     :parameters (?v3 - type_2 ?v7 - type_4 ?v6 - type_1)
     :precondition (and (pred_4 ?v7 ?v6) (pred_4 ?v3 ?v6) (pred_5 ?v3))
     :effect (and
        (not (pred_4 ?v7 ?v6))
        (not (pred_5 ?v3))
        (pred_2 ?v3 ?v7))
    )

    (:action op_3
     :parameters (?v3 - type_2 ?v7 - type_4 ?v6 - type_1)
     :precondition (and (pred_4 ?v3 ?v6) (pred_2 ?v3 ?v7))
     :effect (and
        (pred_5 ?v3)
        (not (pred_2 ?v3 ?v7))
        (pred_4 ?v7 ?v6))
    )

    (:action op_2
     :parameters (?v3 - type_2 ?v2 - type_1 ?v1 - type_1)
     :precondition (and (pred_3 ?v2 ?v1) (pred_4 ?v3 ?v2) (not (= ?v2 ?v1)))
     :effect (and
        (not (pred_4 ?v3 ?v2))
        (pred_4 ?v3 ?v1)
        (pred_1 ?v3 ?v2))
        )
        
    )
)
