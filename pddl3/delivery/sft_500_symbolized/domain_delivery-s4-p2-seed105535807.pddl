
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_5 ?v5 - type_4 ?v4 - type_1)
        (pred_4 ?v5 - type_3 ?v4 - type_2)
        (pred_3 ?v5 - type_3)
        (pred_1 ?v5 - type_1 ?v4 - type_1)
          (pred_2 ?v6 - type_3 ?v7 - type_1)   
    )

    (:action op_3
     :parameters (?v6 - type_3 ?v3 - type_2 ?v2 - type_1)
     :precondition (and (pred_5 ?v3 ?v2) (pred_5 ?v6 ?v2) (pred_3 ?v6))
     :effect (and
        (not (pred_5 ?v3 ?v2))
        (not (pred_3 ?v6))
        (pred_4 ?v6 ?v3))
    )

    (:action op_2
     :parameters (?v6 - type_3 ?v3 - type_2 ?v2 - type_1)
     :precondition (and (pred_5 ?v6 ?v2) (pred_4 ?v6 ?v3))
     :effect (and
        (pred_3 ?v6)
        (not (pred_4 ?v6 ?v3))
        (pred_5 ?v3 ?v2))
    )

    (:action op_1
     :parameters (?v6 - type_3 ?v8 - type_1 ?v1 - type_1)
     :precondition (and (pred_1 ?v8 ?v1) (pred_5 ?v6 ?v8) (not (= ?v8 ?v1)))
     :effect (and
        (not (pred_5 ?v6 ?v8))
        (pred_5 ?v6 ?v1)
        (pred_2 ?v6 ?v8))
        )
        
    )
)
