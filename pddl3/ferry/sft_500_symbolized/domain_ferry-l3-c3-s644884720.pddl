(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_4 ?v5)
		(pred_6 ?v3)
		(pred_1 ?v3)
		(pred_2 ?v5 ?v3)
		(pred_3)
		(pred_5 ?v5))

   (:action op_1
       :parameters  (?v4 ?v8)
       :precondition (and (not-eq ?v4 ?v8) 
                          (pred_6 ?v4) (pred_6 ?v8) (pred_1 ?v4))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v4))))


   (:action op_3
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_4 ?v2) (pred_6 ?v7)
			    (pred_2 ?v2 ?v7) (pred_1 ?v7) (pred_3))
       :effect (and (pred_5 ?v2)
		    (not (pred_2 ?v2 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_4 ?v2) (pred_6 ?v7)
			    (pred_5 ?v2) (pred_1 ?v7))
       :effect (and (pred_2 ?v2 ?v7)
		    (pred_3)
		    (not (pred_5 ?v2)))))
