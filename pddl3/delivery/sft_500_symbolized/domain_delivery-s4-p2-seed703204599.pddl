
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_4 - object
        type_1 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_3 ?v2 - type_4 ?v4 - type_2)
        (pred_2 ?v2 - type_3 ?v4 - type_1)
        (pred_4 ?v2 - type_3)
        (pred_1 ?v2 - type_2 ?v4 - type_2)
          (pred_5 ?v8 - type_3 ?v1 - type_2)   
    )

    (:action op_2
     :parameters (?v8 - type_3 ?v6 - type_1 ?v5 - type_2)
     :precondition (and (pred_3 ?v6 ?v5) (pred_3 ?v8 ?v5) (pred_4 ?v8))
     :effect (and
        (not (pred_3 ?v6 ?v5))
        (not (pred_4 ?v8))
        (pred_2 ?v8 ?v6))
    )

    (:action op_3
     :parameters (?v8 - type_3 ?v6 - type_1 ?v5 - type_2)
     :precondition (and (pred_3 ?v8 ?v5) (pred_2 ?v8 ?v6))
     :effect (and
        (pred_4 ?v8)
        (not (pred_2 ?v8 ?v6))
        (pred_3 ?v6 ?v5))
    )

    (:action op_1
     :parameters (?v8 - type_3 ?v3 - type_2 ?v7 - type_2)
     :precondition (and (pred_1 ?v3 ?v7) (pred_3 ?v8 ?v3) (not (= ?v3 ?v7)))
     :effect (and
        (not (pred_3 ?v8 ?v3))
        (pred_3 ?v8 ?v7)
        (pred_5 ?v8 ?v3))
        )
        
    )
)
