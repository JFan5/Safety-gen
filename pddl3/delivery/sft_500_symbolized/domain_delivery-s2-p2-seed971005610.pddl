
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_1 - object
        type_4 - object
        type_2 - type_4
        type_3 - type_4
    )

    (:predicates
        (pred_1 ?v5 - type_4 ?v2 - type_1)
        (pred_3 ?v5 - type_3 ?v2 - type_2)
        (pred_4 ?v5 - type_3)
        (pred_5 ?v5 - type_1 ?v2 - type_1)
          (pred_2 ?v3 - type_3 ?v1 - type_1)   
    )

    (:action op_2
     :parameters (?v3 - type_3 ?v8 - type_2 ?v4 - type_1)
     :precondition (and (pred_1 ?v8 ?v4) (pred_1 ?v3 ?v4) (pred_4 ?v3))
     :effect (and
        (not (pred_1 ?v8 ?v4))
        (not (pred_4 ?v3))
        (pred_3 ?v3 ?v8))
    )

    (:action op_1
     :parameters (?v3 - type_3 ?v8 - type_2 ?v4 - type_1)
     :precondition (and (pred_1 ?v3 ?v4) (pred_3 ?v3 ?v8))
     :effect (and
        (pred_4 ?v3)
        (not (pred_3 ?v3 ?v8))
        (pred_1 ?v8 ?v4))
    )

    (:action op_3
     :parameters (?v3 - type_3 ?v7 - type_1 ?v6 - type_1)
     :precondition (and (pred_5 ?v7 ?v6) (pred_1 ?v3 ?v7) (not (= ?v7 ?v6)))
     :effect (and
        (not (pred_1 ?v3 ?v7))
        (pred_1 ?v3 ?v6)
        (pred_2 ?v3 ?v7))
        )
        
    )
)
