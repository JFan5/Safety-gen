
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_3 - type_4
        type_1 - type_4
    )

    (:predicates
        (pred_1 ?v5 - type_4 ?v4 - type_2)
        (pred_3 ?v5 - type_1 ?v4 - type_3)
        (pred_5 ?v5 - type_1)
        (pred_2 ?v5 - type_2 ?v4 - type_2)
          (pred_4 ?v3 - type_1 ?v8 - type_2)   
    )

    (:action op_3
     :parameters (?v3 - type_1 ?v7 - type_3 ?v1 - type_2)
     :precondition (and (pred_1 ?v7 ?v1) (pred_1 ?v3 ?v1) (pred_5 ?v3))
     :effect (and
        (not (pred_1 ?v7 ?v1))
        (not (pred_5 ?v3))
        (pred_3 ?v3 ?v7))
    )

    (:action op_1
     :parameters (?v3 - type_1 ?v7 - type_3 ?v1 - type_2)
     :precondition (and (pred_1 ?v3 ?v1) (pred_3 ?v3 ?v7))
     :effect (and
        (pred_5 ?v3)
        (not (pred_3 ?v3 ?v7))
        (pred_1 ?v7 ?v1))
    )

    (:action op_2
     :parameters (?v3 - type_1 ?v6 - type_2 ?v2 - type_2)
     :precondition (and (pred_2 ?v6 ?v2) (pred_1 ?v3 ?v6) (not (= ?v6 ?v2)))
     :effect (and
        (not (pred_1 ?v3 ?v6))
        (pred_1 ?v3 ?v2)
        (pred_4 ?v3 ?v6))
        )
        
    )
)
