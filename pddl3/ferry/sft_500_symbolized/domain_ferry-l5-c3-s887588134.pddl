(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_4 ?v6)
		(pred_5 ?v1)
		(pred_6 ?v1)
		(pred_2 ?v6 ?v1)
		(pred_3)
		(pred_1 ?v6))

   (:action op_1
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_5 ?v3) (pred_5 ?v2) (pred_6 ?v3))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v3))))


   (:action op_2
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_4 ?v7) (pred_5 ?v4)
			    (pred_2 ?v7 ?v4) (pred_6 ?v4) (pred_3))
       :effect (and (pred_1 ?v7)
		    (not (pred_2 ?v7 ?v4)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_4 ?v7) (pred_5 ?v4)
			    (pred_1 ?v7) (pred_6 ?v4))
       :effect (and (pred_2 ?v7 ?v4)
		    (pred_3)
		    (not (pred_1 ?v7)))))
