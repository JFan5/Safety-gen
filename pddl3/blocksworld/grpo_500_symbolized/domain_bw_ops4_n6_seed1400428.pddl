(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_3 ?v2)
               (pred_4 ?v2)
               (pred_5)
               (pred_1 ?v2)
               (pred_2 ?v2 ?v1))

  (:action op_2
    :parameters (?v4)
    :precondition (and (pred_3 ?v4) (pred_4 ?v4) (pred_5))
    :effect (and (pred_1 ?v4) (not (pred_3 ?v4)) (not (pred_4 ?v4)) 
                 (not (pred_5))))

  (:action op_3
    :parameters  (?v4)
    :precondition (pred_1 ?v4)
    :effect (and (pred_3 ?v4) (pred_5) (pred_4 ?v4) 
                 (not (pred_1 ?v4))))

  (:action op_4
    :parameters  (?v4 ?v3)
    :precondition (and (pred_3 ?v3) (pred_1 ?v4))
    :effect (and (pred_5) (pred_3 ?v4) (pred_2 ?v4 ?v3)
                 (not (pred_3 ?v3)) (not (pred_1 ?v4))))

  (:action op_1
    :parameters  (?v4 ?v3)
    :precondition (and (pred_2 ?v4 ?v3) (pred_3 ?v4) (pred_5))
    :effect (and (pred_1 ?v4) (pred_3 ?v3)
                 (not (pred_2 ?v4 ?v3)) (not (pred_3 ?v4)) (not (pred_5)))))
