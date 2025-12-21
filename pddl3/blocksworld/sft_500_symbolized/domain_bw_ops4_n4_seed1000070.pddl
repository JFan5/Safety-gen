(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (pred_3 ?v1)
               (pred_5 ?v1)
               (pred_2)
               (pred_4 ?v1)
               (pred_1 ?v1 ?v4))

  (:action op_1
    :parameters (?v2)
    :precondition (and (pred_3 ?v2) (pred_5 ?v2) (pred_2))
    :effect (and (pred_4 ?v2) (not (pred_3 ?v2)) (not (pred_5 ?v2)) 
                 (not (pred_2))))

  (:action op_4
    :parameters  (?v2)
    :precondition (pred_4 ?v2)
    :effect (and (pred_3 ?v2) (pred_2) (pred_5 ?v2) 
                 (not (pred_4 ?v2))))

  (:action op_2
    :parameters  (?v2 ?v3)
    :precondition (and (pred_3 ?v3) (pred_4 ?v2))
    :effect (and (pred_2) (pred_3 ?v2) (pred_1 ?v2 ?v3)
                 (not (pred_3 ?v3)) (not (pred_4 ?v2))))

  (:action op_3
    :parameters  (?v2 ?v3)
    :precondition (and (pred_1 ?v2 ?v3) (pred_3 ?v2) (pred_2))
    :effect (and (pred_4 ?v2) (pred_3 ?v3)
                 (not (pred_1 ?v2 ?v3)) (not (pred_3 ?v2)) (not (pred_2)))))
