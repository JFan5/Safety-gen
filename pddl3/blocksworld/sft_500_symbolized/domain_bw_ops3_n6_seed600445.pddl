(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_4 ?v3)
               (pred_2 ?v3)
               (pred_1)
               (pred_5 ?v3)
               (pred_3 ?v3 ?v1))

  (:action op_3
    :parameters (?v4)
    :precondition (and (pred_4 ?v4) (pred_2 ?v4) (pred_1))
    :effect (and (pred_5 ?v4) (not (pred_4 ?v4)) (not (pred_2 ?v4)) 
                 (not (pred_1))))

  (:action op_2
    :parameters  (?v4)
    :precondition (pred_5 ?v4)
    :effect (and (pred_4 ?v4) (pred_1) (pred_2 ?v4) 
                 (not (pred_5 ?v4))))

  (:action op_1
    :parameters  (?v4 ?v2)
    :precondition (and (pred_4 ?v2) (pred_5 ?v4))
    :effect (and (pred_1) (pred_4 ?v4) (pred_3 ?v4 ?v2)
                 (not (pred_4 ?v2)) (not (pred_5 ?v4))))

  (:action op_4
    :parameters  (?v4 ?v2)
    :precondition (and (pred_3 ?v4 ?v2) (pred_4 ?v4) (pred_1))
    :effect (and (pred_5 ?v4) (pred_4 ?v2)
                 (not (pred_3 ?v4 ?v2)) (not (pred_4 ?v4)) (not (pred_1)))))
