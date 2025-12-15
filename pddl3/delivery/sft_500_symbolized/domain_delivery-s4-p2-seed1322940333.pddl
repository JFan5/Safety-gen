
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_3 - object
        type_2 - object
        type_1 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_2 ?v3 - type_2 ?v1 - type_3)
        (pred_4 ?v3 - type_4 ?v1 - type_1)
        (pred_1 ?v3 - type_4)
        (pred_5 ?v3 - type_3 ?v1 - type_3)
          (pred_3 ?v5 - type_4 ?v7 - type_3)   
    )

    (:action op_2
     :parameters (?v5 - type_4 ?v4 - type_1 ?v2 - type_3)
     :precondition (and (pred_2 ?v4 ?v2) (pred_2 ?v5 ?v2) (pred_1 ?v5))
     :effect (and
        (not (pred_2 ?v4 ?v2))
        (not (pred_1 ?v5))
        (pred_4 ?v5 ?v4))
    )

    (:action op_3
     :parameters (?v5 - type_4 ?v4 - type_1 ?v2 - type_3)
     :precondition (and (pred_2 ?v5 ?v2) (pred_4 ?v5 ?v4))
     :effect (and
        (pred_1 ?v5)
        (not (pred_4 ?v5 ?v4))
        (pred_2 ?v4 ?v2))
    )

    (:action op_1
     :parameters (?v5 - type_4 ?v8 - type_3 ?v6 - type_3)
     :precondition (and (pred_5 ?v8 ?v6) (pred_2 ?v5 ?v8) (not (= ?v8 ?v6)))
     :effect (and
        (not (pred_2 ?v5 ?v8))
        (pred_2 ?v5 ?v6)
        (pred_3 ?v5 ?v8))
        )
        
    )
)
