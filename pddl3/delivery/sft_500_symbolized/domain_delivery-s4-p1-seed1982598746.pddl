
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_2 - object
        type_1 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_5 ?v1 - type_2 ?v7 - type_3)
        (pred_1 ?v1 - type_4 ?v7 - type_1)
        (pred_2 ?v1 - type_4)
        (pred_4 ?v1 - type_3 ?v7 - type_3)
          (pred_3 ?v8 - type_4 ?v5 - type_3)   
    )

    (:action op_2
     :parameters (?v8 - type_4 ?v6 - type_1 ?v2 - type_3)
     :precondition (and (pred_5 ?v6 ?v2) (pred_5 ?v8 ?v2) (pred_2 ?v8))
     :effect (and
        (not (pred_5 ?v6 ?v2))
        (not (pred_2 ?v8))
        (pred_1 ?v8 ?v6))
    )

    (:action op_1
     :parameters (?v8 - type_4 ?v6 - type_1 ?v2 - type_3)
     :precondition (and (pred_5 ?v8 ?v2) (pred_1 ?v8 ?v6))
     :effect (and
        (pred_2 ?v8)
        (not (pred_1 ?v8 ?v6))
        (pred_5 ?v6 ?v2))
    )

    (:action op_3
     :parameters (?v8 - type_4 ?v3 - type_3 ?v4 - type_3)
     :precondition (and (pred_4 ?v3 ?v4) (pred_5 ?v8 ?v3) (not (= ?v3 ?v4)))
     :effect (and
        (not (pred_5 ?v8 ?v3))
        (pred_5 ?v8 ?v4)
        (pred_3 ?v8 ?v3))
        )
        
    )
)
