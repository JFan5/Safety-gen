
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_1 ?v6 - type_4 ?v4 - type_1)
        (pred_3 ?v6 - type_3 ?v4 - type_2)
        (pred_5 ?v6 - type_3)
        (pred_4 ?v6 - type_1 ?v4 - type_1)
          (pred_2 ?v2 - type_3 ?v8 - type_1)   
    )

    (:action op_2
     :parameters (?v2 - type_3 ?v3 - type_2 ?v1 - type_1)
     :precondition (and (pred_1 ?v3 ?v1) (pred_1 ?v2 ?v1) (pred_5 ?v2))
     :effect (and
        (not (pred_1 ?v3 ?v1))
        (not (pred_5 ?v2))
        (pred_3 ?v2 ?v3))
    )

    (:action op_1
     :parameters (?v2 - type_3 ?v3 - type_2 ?v1 - type_1)
     :precondition (and (pred_1 ?v2 ?v1) (pred_3 ?v2 ?v3))
     :effect (and
        (pred_5 ?v2)
        (not (pred_3 ?v2 ?v3))
        (pred_1 ?v3 ?v1))
    )

    (:action op_3
     :parameters (?v2 - type_3 ?v7 - type_1 ?v5 - type_1)
     :precondition (and (pred_4 ?v7 ?v5) (pred_1 ?v2 ?v7) (not (= ?v7 ?v5)))
     :effect (and
        (not (pred_1 ?v2 ?v7))
        (pred_1 ?v2 ?v5)
        (pred_2 ?v2 ?v7))
        )
        
    )
)
