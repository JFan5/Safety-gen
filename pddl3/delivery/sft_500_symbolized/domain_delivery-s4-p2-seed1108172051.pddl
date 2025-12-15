
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_3 - object
        type_2 - type_3
        type_1 - type_3
    )

    (:predicates
        (pred_5 ?v1 - type_3 ?v2 - type_4)
        (pred_1 ?v1 - type_1 ?v2 - type_2)
        (pred_3 ?v1 - type_1)
        (pred_4 ?v1 - type_4 ?v2 - type_4)
          (pred_2 ?v6 - type_1 ?v7 - type_4)   
    )

    (:action op_1
     :parameters (?v6 - type_1 ?v5 - type_2 ?v8 - type_4)
     :precondition (and (pred_5 ?v5 ?v8) (pred_5 ?v6 ?v8) (pred_3 ?v6))
     :effect (and
        (not (pred_5 ?v5 ?v8))
        (not (pred_3 ?v6))
        (pred_1 ?v6 ?v5))
    )

    (:action op_3
     :parameters (?v6 - type_1 ?v5 - type_2 ?v8 - type_4)
     :precondition (and (pred_5 ?v6 ?v8) (pred_1 ?v6 ?v5))
     :effect (and
        (pred_3 ?v6)
        (not (pred_1 ?v6 ?v5))
        (pred_5 ?v5 ?v8))
    )

    (:action op_2
     :parameters (?v6 - type_1 ?v3 - type_4 ?v4 - type_4)
     :precondition (and (pred_4 ?v3 ?v4) (pred_5 ?v6 ?v3) (not (= ?v3 ?v4)))
     :effect (and
        (not (pred_5 ?v6 ?v3))
        (pred_5 ?v6 ?v4)
        (pred_2 ?v6 ?v3))
        )
        
    )
)
