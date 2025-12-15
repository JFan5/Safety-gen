
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_4 - type_3
        type_1 - type_3
    )

    (:predicates
        (pred_2 ?v8 - type_3 ?v3 - type_2)
        (pred_5 ?v8 - type_1 ?v3 - type_4)
        (pred_3 ?v8 - type_1)
        (pred_4 ?v8 - type_2 ?v3 - type_2)
          (pred_1 ?v2 - type_1 ?v5 - type_2)   
    )

    (:action op_2
     :parameters (?v2 - type_1 ?v1 - type_4 ?v6 - type_2)
     :precondition (and (pred_2 ?v1 ?v6) (pred_2 ?v2 ?v6) (pred_3 ?v2))
     :effect (and
        (not (pred_2 ?v1 ?v6))
        (not (pred_3 ?v2))
        (pred_5 ?v2 ?v1))
    )

    (:action op_1
     :parameters (?v2 - type_1 ?v1 - type_4 ?v6 - type_2)
     :precondition (and (pred_2 ?v2 ?v6) (pred_5 ?v2 ?v1))
     :effect (and
        (pred_3 ?v2)
        (not (pred_5 ?v2 ?v1))
        (pred_2 ?v1 ?v6))
    )

    (:action op_3
     :parameters (?v2 - type_1 ?v4 - type_2 ?v7 - type_2)
     :precondition (and (pred_4 ?v4 ?v7) (pred_2 ?v2 ?v4) (not (= ?v4 ?v7)))
     :effect (and
        (not (pred_2 ?v2 ?v4))
        (pred_2 ?v2 ?v7)
        (pred_1 ?v2 ?v4))
        )
        
    )
)
