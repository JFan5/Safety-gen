
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_1 - object
        type_2 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_5 ?v3 - type_1 ?v4 - type_3)
        (pred_2 ?v3 - type_4 ?v4 - type_2)
        (pred_4 ?v3 - type_4)
        (pred_3 ?v3 - type_3 ?v4 - type_3)
          (pred_1 ?v2 - type_4 ?v7 - type_3)   
    )

    (:action op_1
     :parameters (?v2 - type_4 ?v5 - type_2 ?v6 - type_3)
     :precondition (and (pred_5 ?v5 ?v6) (pred_5 ?v2 ?v6) (pred_4 ?v2))
     :effect (and
        (not (pred_5 ?v5 ?v6))
        (not (pred_4 ?v2))
        (pred_2 ?v2 ?v5))
    )

    (:action op_2
     :parameters (?v2 - type_4 ?v5 - type_2 ?v6 - type_3)
     :precondition (and (pred_5 ?v2 ?v6) (pred_2 ?v2 ?v5))
     :effect (and
        (pred_4 ?v2)
        (not (pred_2 ?v2 ?v5))
        (pred_5 ?v5 ?v6))
    )

    (:action op_3
     :parameters (?v2 - type_4 ?v8 - type_3 ?v1 - type_3)
     :precondition (and (pred_3 ?v8 ?v1) (pred_5 ?v2 ?v8) (not (= ?v8 ?v1)))
     :effect (and
        (not (pred_5 ?v2 ?v8))
        (pred_5 ?v2 ?v1)
        (pred_1 ?v2 ?v8))
        )
        
    )
)
