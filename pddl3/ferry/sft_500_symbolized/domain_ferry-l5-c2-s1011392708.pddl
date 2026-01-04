(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_2 ?v4)
		(pred_1 ?v6)
		(pred_6 ?v6)
		(pred_3 ?v4 ?v6)
		(pred_4)
		(pred_5 ?v4))

   (:action op_1
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_1 ?v2) (pred_1 ?v8) (pred_6 ?v2))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v2))))


   (:action op_2
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_2 ?v1) (pred_1 ?v7)
			    (pred_3 ?v1 ?v7) (pred_6 ?v7) (pred_4))
       :effect (and (pred_5 ?v1)
		    (not (pred_3 ?v1 ?v7)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_2 ?v1) (pred_1 ?v7)
			    (pred_5 ?v1) (pred_6 ?v7))
       :effect (and (pred_3 ?v1 ?v7)
		    (pred_4)
		    (not (pred_5 ?v1)))))
