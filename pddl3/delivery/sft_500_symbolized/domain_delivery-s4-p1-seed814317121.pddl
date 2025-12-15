
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_3 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_4 ?v3 - type_2 ?v5 - type_1)
        (pred_2 ?v3 - type_4 ?v5 - type_3)
        (pred_3 ?v3 - type_4)
        (pred_1 ?v3 - type_1 ?v5 - type_1)
          (pred_5 ?v8 - type_4 ?v2 - type_1)   
    )

    (:action op_2
     :parameters (?v8 - type_4 ?v4 - type_3 ?v6 - type_1)
     :precondition (and (pred_4 ?v4 ?v6) (pred_4 ?v8 ?v6) (pred_3 ?v8))
     :effect (and
        (not (pred_4 ?v4 ?v6))
        (not (pred_3 ?v8))
        (pred_2 ?v8 ?v4))
    )

    (:action op_3
     :parameters (?v8 - type_4 ?v4 - type_3 ?v6 - type_1)
     :precondition (and (pred_4 ?v8 ?v6) (pred_2 ?v8 ?v4))
     :effect (and
        (pred_3 ?v8)
        (not (pred_2 ?v8 ?v4))
        (pred_4 ?v4 ?v6))
    )

    (:action op_1
     :parameters (?v8 - type_4 ?v1 - type_1 ?v7 - type_1)
     :precondition (and (pred_1 ?v1 ?v7) (pred_4 ?v8 ?v1) (not (= ?v1 ?v7)))
     :effect (and
        (not (pred_4 ?v8 ?v1))
        (pred_4 ?v8 ?v7)
        (pred_5 ?v8 ?v1))
        )
        
    )
)
