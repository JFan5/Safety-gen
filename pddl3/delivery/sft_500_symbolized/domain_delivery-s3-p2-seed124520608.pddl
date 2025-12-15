
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_2 - object
        type_4 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_2 ?v4 - type_2 ?v7 - type_3)
        (pred_4 ?v4 - type_1 ?v7 - type_4)
        (pred_5 ?v4 - type_1)
        (pred_3 ?v4 - type_3 ?v7 - type_3)
          (pred_1 ?v6 - type_1 ?v3 - type_3)   
    )

    (:action op_3
     :parameters (?v6 - type_1 ?v8 - type_4 ?v5 - type_3)
     :precondition (and (pred_2 ?v8 ?v5) (pred_2 ?v6 ?v5) (pred_5 ?v6))
     :effect (and
        (not (pred_2 ?v8 ?v5))
        (not (pred_5 ?v6))
        (pred_4 ?v6 ?v8))
    )

    (:action op_2
     :parameters (?v6 - type_1 ?v8 - type_4 ?v5 - type_3)
     :precondition (and (pred_2 ?v6 ?v5) (pred_4 ?v6 ?v8))
     :effect (and
        (pred_5 ?v6)
        (not (pred_4 ?v6 ?v8))
        (pred_2 ?v8 ?v5))
    )

    (:action op_1
     :parameters (?v6 - type_1 ?v2 - type_3 ?v1 - type_3)
     :precondition (and (pred_3 ?v2 ?v1) (pred_2 ?v6 ?v2) (not (= ?v2 ?v1)))
     :effect (and
        (not (pred_2 ?v6 ?v2))
        (pred_2 ?v6 ?v1)
        (pred_1 ?v6 ?v2))
        )
        
    )
)
