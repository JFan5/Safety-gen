
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_3 - type_1
        type_2 - type_1
    )

    (:predicates
        (pred_4 ?v1 - type_1 ?v3 - type_4)
        (pred_5 ?v1 - type_2 ?v3 - type_3)
        (pred_2 ?v1 - type_2)
        (pred_3 ?v1 - type_4 ?v3 - type_4)
          (pred_1 ?v7 - type_2 ?v4 - type_4)   
    )

    (:action op_2
     :parameters (?v7 - type_2 ?v6 - type_3 ?v8 - type_4)
     :precondition (and (pred_4 ?v6 ?v8) (pred_4 ?v7 ?v8) (pred_2 ?v7))
     :effect (and
        (not (pred_4 ?v6 ?v8))
        (not (pred_2 ?v7))
        (pred_5 ?v7 ?v6))
    )

    (:action op_1
     :parameters (?v7 - type_2 ?v6 - type_3 ?v8 - type_4)
     :precondition (and (pred_4 ?v7 ?v8) (pred_5 ?v7 ?v6))
     :effect (and
        (pred_2 ?v7)
        (not (pred_5 ?v7 ?v6))
        (pred_4 ?v6 ?v8))
    )

    (:action op_3
     :parameters (?v7 - type_2 ?v5 - type_4 ?v2 - type_4)
     :precondition (and (pred_3 ?v5 ?v2) (pred_4 ?v7 ?v5) (not (= ?v5 ?v2)))
     :effect (and
        (not (pred_4 ?v7 ?v5))
        (pred_4 ?v7 ?v2)
        (pred_1 ?v7 ?v5))
        )
        
    )
)
