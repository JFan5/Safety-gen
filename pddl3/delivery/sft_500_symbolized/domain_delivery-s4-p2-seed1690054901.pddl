
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_1 - object
        type_3 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_3 ?v6 - type_1 ?v3 - type_2)
        (pred_5 ?v6 - type_4 ?v3 - type_3)
        (pred_1 ?v6 - type_4)
        (pred_2 ?v6 - type_2 ?v3 - type_2)
          (pred_4 ?v8 - type_4 ?v2 - type_2)   
    )

    (:action op_1
     :parameters (?v8 - type_4 ?v4 - type_3 ?v1 - type_2)
     :precondition (and (pred_3 ?v4 ?v1) (pred_3 ?v8 ?v1) (pred_1 ?v8))
     :effect (and
        (not (pred_3 ?v4 ?v1))
        (not (pred_1 ?v8))
        (pred_5 ?v8 ?v4))
    )

    (:action op_2
     :parameters (?v8 - type_4 ?v4 - type_3 ?v1 - type_2)
     :precondition (and (pred_3 ?v8 ?v1) (pred_5 ?v8 ?v4))
     :effect (and
        (pred_1 ?v8)
        (not (pred_5 ?v8 ?v4))
        (pred_3 ?v4 ?v1))
    )

    (:action op_3
     :parameters (?v8 - type_4 ?v5 - type_2 ?v7 - type_2)
     :precondition (and (pred_2 ?v5 ?v7) (pred_3 ?v8 ?v5) (not (= ?v5 ?v7)))
     :effect (and
        (not (pred_3 ?v8 ?v5))
        (pred_3 ?v8 ?v7)
        (pred_4 ?v8 ?v5))
        )
        
    )
)
