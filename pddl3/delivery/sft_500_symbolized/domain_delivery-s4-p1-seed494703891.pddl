
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_2 ?v2 - type_2 ?v4 - type_4)
        (pred_4 ?v2 - type_1 ?v4 - type_3)
        (pred_1 ?v2 - type_1)
        (pred_5 ?v2 - type_4 ?v4 - type_4)
          (pred_3 ?v8 - type_1 ?v3 - type_4)   
    )

    (:action op_3
     :parameters (?v8 - type_1 ?v6 - type_3 ?v5 - type_4)
     :precondition (and (pred_2 ?v6 ?v5) (pred_2 ?v8 ?v5) (pred_1 ?v8))
     :effect (and
        (not (pred_2 ?v6 ?v5))
        (not (pred_1 ?v8))
        (pred_4 ?v8 ?v6))
    )

    (:action op_1
     :parameters (?v8 - type_1 ?v6 - type_3 ?v5 - type_4)
     :precondition (and (pred_2 ?v8 ?v5) (pred_4 ?v8 ?v6))
     :effect (and
        (pred_1 ?v8)
        (not (pred_4 ?v8 ?v6))
        (pred_2 ?v6 ?v5))
    )

    (:action op_2
     :parameters (?v8 - type_1 ?v1 - type_4 ?v7 - type_4)
     :precondition (and (pred_5 ?v1 ?v7) (pred_2 ?v8 ?v1) (not (= ?v1 ?v7)))
     :effect (and
        (not (pred_2 ?v8 ?v1))
        (pred_2 ?v8 ?v7)
        (pred_3 ?v8 ?v1))
        )
        
    )
)
