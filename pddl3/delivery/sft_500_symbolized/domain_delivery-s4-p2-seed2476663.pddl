
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_2 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_1 ?v1 - type_1 ?v2 - type_4)
        (pred_3 ?v1 - type_3 ?v2 - type_2)
        (pred_4 ?v1 - type_3)
        (pred_2 ?v1 - type_4 ?v2 - type_4)
          (pred_5 ?v8 - type_3 ?v4 - type_4)   
    )

    (:action op_3
     :parameters (?v8 - type_3 ?v7 - type_2 ?v5 - type_4)
     :precondition (and (pred_1 ?v7 ?v5) (pred_1 ?v8 ?v5) (pred_4 ?v8))
     :effect (and
        (not (pred_1 ?v7 ?v5))
        (not (pred_4 ?v8))
        (pred_3 ?v8 ?v7))
    )

    (:action op_1
     :parameters (?v8 - type_3 ?v7 - type_2 ?v5 - type_4)
     :precondition (and (pred_1 ?v8 ?v5) (pred_3 ?v8 ?v7))
     :effect (and
        (pred_4 ?v8)
        (not (pred_3 ?v8 ?v7))
        (pred_1 ?v7 ?v5))
    )

    (:action op_2
     :parameters (?v8 - type_3 ?v6 - type_4 ?v3 - type_4)
     :precondition (and (pred_2 ?v6 ?v3) (pred_1 ?v8 ?v6) (not (= ?v6 ?v3)))
     :effect (and
        (not (pred_1 ?v8 ?v6))
        (pred_1 ?v8 ?v3)
        (pred_5 ?v8 ?v6))
        )
        
    )
)
