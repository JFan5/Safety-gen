
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_1 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_2 ?v4 - type_3 ?v2 - type_2)
        (pred_4 ?v4 - type_4 ?v2 - type_1)
        (pred_5 ?v4 - type_4)
        (pred_1 ?v4 - type_2 ?v2 - type_2)
          (pred_3 ?v3 - type_4 ?v5 - type_2)   
    )

    (:action op_1
     :parameters (?v3 - type_4 ?v8 - type_1 ?v7 - type_2)
     :precondition (and (pred_2 ?v8 ?v7) (pred_2 ?v3 ?v7) (pred_5 ?v3))
     :effect (and
        (not (pred_2 ?v8 ?v7))
        (not (pred_5 ?v3))
        (pred_4 ?v3 ?v8))
    )

    (:action op_3
     :parameters (?v3 - type_4 ?v8 - type_1 ?v7 - type_2)
     :precondition (and (pred_2 ?v3 ?v7) (pred_4 ?v3 ?v8))
     :effect (and
        (pred_5 ?v3)
        (not (pred_4 ?v3 ?v8))
        (pred_2 ?v8 ?v7))
    )

    (:action op_2
     :parameters (?v3 - type_4 ?v6 - type_2 ?v1 - type_2)
     :precondition (and (pred_1 ?v6 ?v1) (pred_2 ?v3 ?v6) (not (= ?v6 ?v1)))
     :effect (and
        (not (pred_2 ?v3 ?v6))
        (pred_2 ?v3 ?v1)
        (pred_3 ?v3 ?v6))
        )
        
    )
)
