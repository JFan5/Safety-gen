
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_4 - type_3
        type_2 - type_3
    )

    (:predicates
        (pred_2 ?v5 - type_3 ?v3 - type_1)
        (pred_3 ?v5 - type_2 ?v3 - type_4)
        (pred_5 ?v5 - type_2)
        (pred_1 ?v5 - type_1 ?v3 - type_1)
          (pred_4 ?v1 - type_2 ?v4 - type_1)   
    )

    (:action op_2
     :parameters (?v1 - type_2 ?v6 - type_4 ?v8 - type_1)
     :precondition (and (pred_2 ?v6 ?v8) (pred_2 ?v1 ?v8) (pred_5 ?v1))
     :effect (and
        (not (pred_2 ?v6 ?v8))
        (not (pred_5 ?v1))
        (pred_3 ?v1 ?v6))
    )

    (:action op_1
     :parameters (?v1 - type_2 ?v6 - type_4 ?v8 - type_1)
     :precondition (and (pred_2 ?v1 ?v8) (pred_3 ?v1 ?v6))
     :effect (and
        (pred_5 ?v1)
        (not (pred_3 ?v1 ?v6))
        (pred_2 ?v6 ?v8))
    )

    (:action op_3
     :parameters (?v1 - type_2 ?v2 - type_1 ?v7 - type_1)
     :precondition (and (pred_1 ?v2 ?v7) (pred_2 ?v1 ?v2) (not (= ?v2 ?v7)))
     :effect (and
        (not (pred_2 ?v1 ?v2))
        (pred_2 ?v1 ?v7)
        (pred_4 ?v1 ?v2))
        )
        
    )
)
