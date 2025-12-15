
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_3 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_2 ?v2 - type_2 ?v6 - type_1)
        (pred_3 ?v2 - type_4 ?v6 - type_3)
        (pred_1 ?v2 - type_4)
        (pred_5 ?v2 - type_1 ?v6 - type_1)
          (pred_4 ?v1 - type_4 ?v7 - type_1)   
    )

    (:action op_1
     :parameters (?v1 - type_4 ?v5 - type_3 ?v3 - type_1)
     :precondition (and (pred_2 ?v5 ?v3) (pred_2 ?v1 ?v3) (pred_1 ?v1))
     :effect (and
        (not (pred_2 ?v5 ?v3))
        (not (pred_1 ?v1))
        (pred_3 ?v1 ?v5))
    )

    (:action op_3
     :parameters (?v1 - type_4 ?v5 - type_3 ?v3 - type_1)
     :precondition (and (pred_2 ?v1 ?v3) (pred_3 ?v1 ?v5))
     :effect (and
        (pred_1 ?v1)
        (not (pred_3 ?v1 ?v5))
        (pred_2 ?v5 ?v3))
    )

    (:action op_2
     :parameters (?v1 - type_4 ?v4 - type_1 ?v8 - type_1)
     :precondition (and (pred_5 ?v4 ?v8) (pred_2 ?v1 ?v4) (not (= ?v4 ?v8)))
     :effect (and
        (not (pred_2 ?v1 ?v4))
        (pred_2 ?v1 ?v8)
        (pred_4 ?v1 ?v4))
        )
        
    )
)
