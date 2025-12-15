
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_1 - object
        type_2 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_2 ?v3 - type_1 ?v5 - type_3)
        (pred_4 ?v3 - type_4 ?v5 - type_2)
        (pred_1 ?v3 - type_4)
        (pred_5 ?v3 - type_3 ?v5 - type_3)
          (pred_3 ?v7 - type_4 ?v4 - type_3)   
    )

    (:action op_1
     :parameters (?v7 - type_4 ?v8 - type_2 ?v1 - type_3)
     :precondition (and (pred_2 ?v8 ?v1) (pred_2 ?v7 ?v1) (pred_1 ?v7))
     :effect (and
        (not (pred_2 ?v8 ?v1))
        (not (pred_1 ?v7))
        (pred_4 ?v7 ?v8))
    )

    (:action op_3
     :parameters (?v7 - type_4 ?v8 - type_2 ?v1 - type_3)
     :precondition (and (pred_2 ?v7 ?v1) (pred_4 ?v7 ?v8))
     :effect (and
        (pred_1 ?v7)
        (not (pred_4 ?v7 ?v8))
        (pred_2 ?v8 ?v1))
    )

    (:action op_2
     :parameters (?v7 - type_4 ?v6 - type_3 ?v2 - type_3)
     :precondition (and (pred_5 ?v6 ?v2) (pred_2 ?v7 ?v6) (not (= ?v6 ?v2)))
     :effect (and
        (not (pred_2 ?v7 ?v6))
        (pred_2 ?v7 ?v2)
        (pred_3 ?v7 ?v6))
        )
        
    )
)
