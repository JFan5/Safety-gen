(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_2 ?v4)
               (pred_3 ?v4)
               (pred_1)
               (pred_4 ?v4)
               (pred_5 ?v4 ?v2))

  (:action op_1
    :parameters (?v3)
    :precondition (and (pred_2 ?v3) (pred_3 ?v3) (pred_1))
    :effect (and (pred_4 ?v3) (not (pred_2 ?v3)) (not (pred_3 ?v3)) 
                 (not (pred_1))))

  (:action op_2
    :parameters  (?v3)
    :precondition (pred_4 ?v3)
    :effect (and (pred_2 ?v3) (pred_1) (pred_3 ?v3) 
                 (not (pred_4 ?v3))))

  (:action op_3
    :parameters  (?v3 ?v1)
    :precondition (and (pred_2 ?v1) (pred_4 ?v3))
    :effect (and (pred_1) (pred_2 ?v3) (pred_5 ?v3 ?v1)
                 (not (pred_2 ?v1)) (not (pred_4 ?v3))))

  (:action op_4
    :parameters  (?v3 ?v1)
    :precondition (and (pred_5 ?v3 ?v1) (pred_2 ?v3) (pred_1))
    :effect (and (pred_4 ?v3) (pred_2 ?v1)
                 (not (pred_5 ?v3 ?v1)) (not (pred_2 ?v3)) (not (pred_1)))))
