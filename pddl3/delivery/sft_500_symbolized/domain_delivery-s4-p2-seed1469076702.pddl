
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_3 - type_4
        type_2 - type_4
    )

    (:predicates
        (pred_3 ?v5 - type_4 ?v7 - type_1)
        (pred_1 ?v5 - type_2 ?v7 - type_3)
        (pred_4 ?v5 - type_2)
        (pred_2 ?v5 - type_1 ?v7 - type_1)
          (pred_5 ?v1 - type_2 ?v2 - type_1)   
    )

    (:action op_2
     :parameters (?v1 - type_2 ?v3 - type_3 ?v4 - type_1)
     :precondition (and (pred_3 ?v3 ?v4) (pred_3 ?v1 ?v4) (pred_4 ?v1))
     :effect (and
        (not (pred_3 ?v3 ?v4))
        (not (pred_4 ?v1))
        (pred_1 ?v1 ?v3))
    )

    (:action op_3
     :parameters (?v1 - type_2 ?v3 - type_3 ?v4 - type_1)
     :precondition (and (pred_3 ?v1 ?v4) (pred_1 ?v1 ?v3))
     :effect (and
        (pred_4 ?v1)
        (not (pred_1 ?v1 ?v3))
        (pred_3 ?v3 ?v4))
    )

    (:action op_1
     :parameters (?v1 - type_2 ?v6 - type_1 ?v8 - type_1)
     :precondition (and (pred_2 ?v6 ?v8) (pred_3 ?v1 ?v6) (not (= ?v6 ?v8)))
     :effect (and
        (not (pred_3 ?v1 ?v6))
        (pred_3 ?v1 ?v8)
        (pred_5 ?v1 ?v6))
        )
        
    )
)
