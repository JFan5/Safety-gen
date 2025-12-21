(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v7)
		(pred_5 ?v4)
		(pred_4 ?v1)
		(pred_6 ?v1)
		(pred_1 ?v4 ?v1)
		(pred_3)
		(pred_2 ?v4))

   (:action op_1
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_4 ?v6) (pred_4 ?v5) (pred_6 ?v6))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v6))))


   (:action op_3
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v3)
			    (pred_1 ?v2 ?v3) (pred_6 ?v3) (pred_3))
       :effect (and (pred_2 ?v2)
		    (not (pred_1 ?v2 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v3)
			    (pred_2 ?v2) (pred_6 ?v3))
       :effect (and (pred_1 ?v2 ?v3)
		    (pred_3)
		    (not (pred_2 ?v2)))))
