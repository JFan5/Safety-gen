
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_1 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_1 ?v1 - type_3 ?v4 - type_2)
        (pred_3 ?v1 - type_4 ?v4 - type_1)
        (pred_2 ?v1 - type_4)
        (pred_5 ?v1 - type_2 ?v4 - type_2)
          (pred_4 ?v8 - type_4 ?v2 - type_2)   
    )

    (:action op_3
     :parameters (?v8 - type_4 ?v7 - type_1 ?v3 - type_2)
     :precondition (and (pred_1 ?v7 ?v3) (pred_1 ?v8 ?v3) (pred_2 ?v8))
     :effect (and
        (not (pred_1 ?v7 ?v3))
        (not (pred_2 ?v8))
        (pred_3 ?v8 ?v7))
    )

    (:action op_2
     :parameters (?v8 - type_4 ?v7 - type_1 ?v3 - type_2)
     :precondition (and (pred_1 ?v8 ?v3) (pred_3 ?v8 ?v7))
     :effect (and
        (pred_2 ?v8)
        (not (pred_3 ?v8 ?v7))
        (pred_1 ?v7 ?v3))
    )

    (:action op_1
     :parameters (?v8 - type_4 ?v5 - type_2 ?v6 - type_2)
     :precondition (and (pred_5 ?v5 ?v6) (pred_1 ?v8 ?v5) (not (= ?v5 ?v6)))
     :effect (and
        (not (pred_1 ?v8 ?v5))
        (pred_1 ?v8 ?v6)
        (pred_4 ?v8 ?v5))
        )
        
    )
)
