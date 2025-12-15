
(define (domain delivery)
    (:requirements :typing :equality :negative-preconditions :constraints)
    (:types
        type_4 - object
        type_1 - object
        type_2 - type_1
        type_3 - type_1
    )

    (:predicates
        (pred_2 ?v5 - type_1 ?v2 - type_4)
        (pred_1 ?v5 - type_3 ?v2 - type_2)
        (pred_5 ?v5 - type_3)
        (pred_3 ?v5 - type_4 ?v2 - type_4)
          (pred_4 ?v8 - type_3 ?v3 - type_4)   
    )

    (:action op_1
     :parameters (?v8 - type_3 ?v1 - type_2 ?v7 - type_4)
     :precondition (and (pred_2 ?v1 ?v7) (pred_2 ?v8 ?v7) (pred_5 ?v8))
     :effect (and
        (not (pred_2 ?v1 ?v7))
        (not (pred_5 ?v8))
        (pred_1 ?v8 ?v1))
    )

    (:action op_3
     :parameters (?v8 - type_3 ?v1 - type_2 ?v7 - type_4)
     :precondition (and (pred_2 ?v8 ?v7) (pred_1 ?v8 ?v1))
     :effect (and
        (pred_5 ?v8)
        (not (pred_1 ?v8 ?v1))
        (pred_2 ?v1 ?v7))
    )

    (:action op_2
     :parameters (?v8 - type_3 ?v4 - type_4 ?v6 - type_4)
     :precondition (and (pred_3 ?v4 ?v6) (pred_2 ?v8 ?v4) (not (= ?v4 ?v6)))
     :effect (and
        (not (pred_2 ?v8 ?v4))
        (pred_2 ?v8 ?v6)
        (pred_4 ?v8 ?v4))
        )
        
    )
)
