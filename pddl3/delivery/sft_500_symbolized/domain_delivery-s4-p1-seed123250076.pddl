
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_2 - object
        type_3 - type_2
        type_1 - type_2
    )

    (:predicates
        (pred_3 ?v7 - type_2 ?v3 - type_4)
        (pred_5 ?v7 - type_1 ?v3 - type_3)
        (pred_4 ?v7 - type_1)
        (pred_1 ?v7 - type_4 ?v3 - type_4)
          (pred_2 ?v5 - type_1 ?v2 - type_4)   
    )

    (:action op_2
     :parameters (?v5 - type_1 ?v8 - type_3 ?v6 - type_4)
     :precondition (and (pred_3 ?v8 ?v6) (pred_3 ?v5 ?v6) (pred_4 ?v5))
     :effect (and
        (not (pred_3 ?v8 ?v6))
        (not (pred_4 ?v5))
        (pred_5 ?v5 ?v8))
    )

    (:action op_1
     :parameters (?v5 - type_1 ?v8 - type_3 ?v6 - type_4)
     :precondition (and (pred_3 ?v5 ?v6) (pred_5 ?v5 ?v8))
     :effect (and
        (pred_4 ?v5)
        (not (pred_5 ?v5 ?v8))
        (pred_3 ?v8 ?v6))
    )

    (:action op_3
     :parameters (?v5 - type_1 ?v1 - type_4 ?v4 - type_4)
     :precondition (and (pred_1 ?v1 ?v4) (pred_3 ?v5 ?v1) (not (= ?v1 ?v4)))
     :effect (and
        (not (pred_3 ?v5 ?v1))
        (pred_3 ?v5 ?v4)
        (pred_2 ?v5 ?v1))
        )
        
    )
)
