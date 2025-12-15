
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_2 - object
        type_3 - type_2
        type_4 - type_2
    )

    (:predicates
        (pred_3 ?v4 - type_2 ?v3 - type_1)
        (pred_4 ?v4 - type_4 ?v3 - type_3)
        (pred_1 ?v4 - type_4)
        (pred_5 ?v4 - type_1 ?v3 - type_1)
          (pred_2 ?v2 - type_4 ?v7 - type_1)   
    )

    (:action op_1
     :parameters (?v2 - type_4 ?v8 - type_3 ?v1 - type_1)
     :precondition (and (pred_3 ?v8 ?v1) (pred_3 ?v2 ?v1) (pred_1 ?v2))
     :effect (and
        (not (pred_3 ?v8 ?v1))
        (not (pred_1 ?v2))
        (pred_4 ?v2 ?v8))
    )

    (:action op_2
     :parameters (?v2 - type_4 ?v8 - type_3 ?v1 - type_1)
     :precondition (and (pred_3 ?v2 ?v1) (pred_4 ?v2 ?v8))
     :effect (and
        (pred_1 ?v2)
        (not (pred_4 ?v2 ?v8))
        (pred_3 ?v8 ?v1))
    )

    (:action op_3
     :parameters (?v2 - type_4 ?v5 - type_1 ?v6 - type_1)
     :precondition (and (pred_5 ?v5 ?v6) (pred_3 ?v2 ?v5) (not (= ?v5 ?v6)))
     :effect (and
        (not (pred_3 ?v2 ?v5))
        (pred_3 ?v2 ?v6)
        (pred_2 ?v2 ?v5))
        )
        
    )
)
