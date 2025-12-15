
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_3 - object
        type_2 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_1 ?v1 - type_3 ?v2 - type_1)
        (pred_4 ?v1 - type_4 ?v2 - type_2)
        (pred_5 ?v1 - type_4)
        (pred_2 ?v1 - type_1 ?v2 - type_1)
          (pred_3 ?v5 - type_4 ?v4 - type_1)   
    )

    (:action op_1
     :parameters (?v5 - type_4 ?v8 - type_2 ?v3 - type_1)
     :precondition (and (pred_1 ?v8 ?v3) (pred_1 ?v5 ?v3) (pred_5 ?v5))
     :effect (and
        (not (pred_1 ?v8 ?v3))
        (not (pred_5 ?v5))
        (pred_4 ?v5 ?v8))
    )

    (:action op_2
     :parameters (?v5 - type_4 ?v8 - type_2 ?v3 - type_1)
     :precondition (and (pred_1 ?v5 ?v3) (pred_4 ?v5 ?v8))
     :effect (and
        (pred_5 ?v5)
        (not (pred_4 ?v5 ?v8))
        (pred_1 ?v8 ?v3))
    )

    (:action op_3
     :parameters (?v5 - type_4 ?v6 - type_1 ?v7 - type_1)
     :precondition (and (pred_2 ?v6 ?v7) (pred_1 ?v5 ?v6) (not (= ?v6 ?v7)))
     :effect (and
        (not (pred_1 ?v5 ?v6))
        (pred_1 ?v5 ?v7)
        (pred_3 ?v5 ?v6))
        )
        
    )
)
