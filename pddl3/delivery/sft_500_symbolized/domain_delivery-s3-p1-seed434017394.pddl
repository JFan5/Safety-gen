
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_2 - object
        type_3 - object
        type_1 - type_3
        type_4 - type_3
    )

    (:predicates
        (pred_2 ?v2 - type_3 ?v1 - type_2)
        (pred_3 ?v2 - type_4 ?v1 - type_1)
        (pred_4 ?v2 - type_4)
        (pred_5 ?v2 - type_2 ?v1 - type_2)
          (pred_1 ?v3 - type_4 ?v7 - type_2)   
    )

    (:action op_1
     :parameters (?v3 - type_4 ?v5 - type_1 ?v8 - type_2)
     :precondition (and (pred_2 ?v5 ?v8) (pred_2 ?v3 ?v8) (pred_4 ?v3))
     :effect (and
        (not (pred_2 ?v5 ?v8))
        (not (pred_4 ?v3))
        (pred_3 ?v3 ?v5))
    )

    (:action op_2
     :parameters (?v3 - type_4 ?v5 - type_1 ?v8 - type_2)
     :precondition (and (pred_2 ?v3 ?v8) (pred_3 ?v3 ?v5))
     :effect (and
        (pred_4 ?v3)
        (not (pred_3 ?v3 ?v5))
        (pred_2 ?v5 ?v8))
    )

    (:action op_3
     :parameters (?v3 - type_4 ?v4 - type_2 ?v6 - type_2)
     :precondition (and (pred_5 ?v4 ?v6) (pred_2 ?v3 ?v4) (not (= ?v4 ?v6)))
     :effect (and
        (not (pred_2 ?v3 ?v4))
        (pred_2 ?v3 ?v6)
        (pred_1 ?v3 ?v4))
        )
        
    )
)
