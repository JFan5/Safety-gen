
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_3 - object
        type_2 - type_3
        type_1 - type_3
    )

    (:predicates
        (pred_2 ?v5 - type_3 ?v6 - type_4)
        (pred_3 ?v5 - type_1 ?v6 - type_2)
        (pred_1 ?v5 - type_1)
        (pred_5 ?v5 - type_4 ?v6 - type_4)
          (pred_4 ?v3 - type_1 ?v4 - type_4)   
    )

    (:action op_3
     :parameters (?v3 - type_1 ?v1 - type_2 ?v8 - type_4)
     :precondition (and (pred_2 ?v1 ?v8) (pred_2 ?v3 ?v8) (pred_1 ?v3))
     :effect (and
        (not (pred_2 ?v1 ?v8))
        (not (pred_1 ?v3))
        (pred_3 ?v3 ?v1))
    )

    (:action op_2
     :parameters (?v3 - type_1 ?v1 - type_2 ?v8 - type_4)
     :precondition (and (pred_2 ?v3 ?v8) (pred_3 ?v3 ?v1))
     :effect (and
        (pred_1 ?v3)
        (not (pred_3 ?v3 ?v1))
        (pred_2 ?v1 ?v8))
    )

    (:action op_1
     :parameters (?v3 - type_1 ?v7 - type_4 ?v2 - type_4)
     :precondition (and (pred_5 ?v7 ?v2) (pred_2 ?v3 ?v7) (not (= ?v7 ?v2)))
     :effect (and
        (not (pred_2 ?v3 ?v7))
        (pred_2 ?v3 ?v2)
        (pred_4 ?v3 ?v7))
        )
        
    )
)
