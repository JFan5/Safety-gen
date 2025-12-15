
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_3 - type_1
        type_2 - type_1
    )

    (:predicates
        (pred_4 ?v6 - type_1 ?v3 - type_4)
        (pred_5 ?v6 - type_2 ?v3 - type_3)
        (pred_3 ?v6 - type_2)
        (pred_2 ?v6 - type_4 ?v3 - type_4)
          (pred_1 ?v8 - type_2 ?v5 - type_4)   
    )

    (:action op_1
     :parameters (?v8 - type_2 ?v1 - type_3 ?v4 - type_4)
     :precondition (and (pred_4 ?v1 ?v4) (pred_4 ?v8 ?v4) (pred_3 ?v8))
     :effect (and
        (not (pred_4 ?v1 ?v4))
        (not (pred_3 ?v8))
        (pred_5 ?v8 ?v1))
    )

    (:action op_2
     :parameters (?v8 - type_2 ?v1 - type_3 ?v4 - type_4)
     :precondition (and (pred_4 ?v8 ?v4) (pred_5 ?v8 ?v1))
     :effect (and
        (pred_3 ?v8)
        (not (pred_5 ?v8 ?v1))
        (pred_4 ?v1 ?v4))
    )

    (:action op_3
     :parameters (?v8 - type_2 ?v2 - type_4 ?v7 - type_4)
     :precondition (and (pred_2 ?v2 ?v7) (pred_4 ?v8 ?v2) (not (= ?v2 ?v7)))
     :effect (and
        (not (pred_4 ?v8 ?v2))
        (pred_4 ?v8 ?v7)
        (pred_1 ?v8 ?v2))
        )
        
    )
)
