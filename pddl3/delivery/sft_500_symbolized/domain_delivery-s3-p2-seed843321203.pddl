
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_1 - object
        type_3 - type_1
        type_4 - type_1
    )

    (:predicates
        (pred_5 ?v1 - type_1 ?v4 - type_2)
        (pred_2 ?v1 - type_4 ?v4 - type_3)
        (pred_4 ?v1 - type_4)
        (pred_1 ?v1 - type_2 ?v4 - type_2)
          (pred_3 ?v6 - type_4 ?v5 - type_2)   
    )

    (:action op_2
     :parameters (?v6 - type_4 ?v8 - type_3 ?v3 - type_2)
     :precondition (and (pred_5 ?v8 ?v3) (pred_5 ?v6 ?v3) (pred_4 ?v6))
     :effect (and
        (not (pred_5 ?v8 ?v3))
        (not (pred_4 ?v6))
        (pred_2 ?v6 ?v8))
    )

    (:action op_1
     :parameters (?v6 - type_4 ?v8 - type_3 ?v3 - type_2)
     :precondition (and (pred_5 ?v6 ?v3) (pred_2 ?v6 ?v8))
     :effect (and
        (pred_4 ?v6)
        (not (pred_2 ?v6 ?v8))
        (pred_5 ?v8 ?v3))
    )

    (:action op_3
     :parameters (?v6 - type_4 ?v7 - type_2 ?v2 - type_2)
     :precondition (and (pred_1 ?v7 ?v2) (pred_5 ?v6 ?v7) (not (= ?v7 ?v2)))
     :effect (and
        (not (pred_5 ?v6 ?v7))
        (pred_5 ?v6 ?v2)
        (pred_3 ?v6 ?v7))
        )
        
    )
)
