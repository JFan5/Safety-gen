
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_2 - object
        type_1 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_3 ?v1 - type_2 ?v5 - type_3)
        (pred_5 ?v1 - type_4 ?v5 - type_1)
        (pred_2 ?v1 - type_4)
        (pred_1 ?v1 - type_3 ?v5 - type_3)
          (pred_4 ?v2 - type_4 ?v4 - type_3)   
    )

    (:action op_1
     :parameters (?v2 - type_4 ?v3 - type_1 ?v7 - type_3)
     :precondition (and (pred_3 ?v3 ?v7) (pred_3 ?v2 ?v7) (pred_2 ?v2))
     :effect (and
        (not (pred_3 ?v3 ?v7))
        (not (pred_2 ?v2))
        (pred_5 ?v2 ?v3))
    )

    (:action op_3
     :parameters (?v2 - type_4 ?v3 - type_1 ?v7 - type_3)
     :precondition (and (pred_3 ?v2 ?v7) (pred_5 ?v2 ?v3))
     :effect (and
        (pred_2 ?v2)
        (not (pred_5 ?v2 ?v3))
        (pred_3 ?v3 ?v7))
    )

    (:action op_2
     :parameters (?v2 - type_4 ?v8 - type_3 ?v6 - type_3)
     :precondition (and (pred_1 ?v8 ?v6) (pred_3 ?v2 ?v8) (not (= ?v8 ?v6)))
     :effect (and
        (not (pred_3 ?v2 ?v8))
        (pred_3 ?v2 ?v6)
        (pred_4 ?v2 ?v8))
        )
        
    )
)
