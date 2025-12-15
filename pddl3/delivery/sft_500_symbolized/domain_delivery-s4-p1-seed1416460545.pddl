
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_1 ?v1 - type_2 ?v2 - type_4)
        (pred_3 ?v1 - type_1 ?v2 - type_3)
        (pred_5 ?v1 - type_1)
        (pred_2 ?v1 - type_4 ?v2 - type_4)
          (pred_4 ?v3 - type_1 ?v8 - type_4)   
    )

    (:action op_2
     :parameters (?v3 - type_1 ?v5 - type_3 ?v6 - type_4)
     :precondition (and (pred_1 ?v5 ?v6) (pred_1 ?v3 ?v6) (pred_5 ?v3))
     :effect (and
        (not (pred_1 ?v5 ?v6))
        (not (pred_5 ?v3))
        (pred_3 ?v3 ?v5))
    )

    (:action op_1
     :parameters (?v3 - type_1 ?v5 - type_3 ?v6 - type_4)
     :precondition (and (pred_1 ?v3 ?v6) (pred_3 ?v3 ?v5))
     :effect (and
        (pred_5 ?v3)
        (not (pred_3 ?v3 ?v5))
        (pred_1 ?v5 ?v6))
    )

    (:action op_3
     :parameters (?v3 - type_1 ?v4 - type_4 ?v7 - type_4)
     :precondition (and (pred_2 ?v4 ?v7) (pred_1 ?v3 ?v4) (not (= ?v4 ?v7)))
     :effect (and
        (not (pred_1 ?v3 ?v4))
        (pred_1 ?v3 ?v7)
        (pred_4 ?v3 ?v4))
        )
        
    )
)
