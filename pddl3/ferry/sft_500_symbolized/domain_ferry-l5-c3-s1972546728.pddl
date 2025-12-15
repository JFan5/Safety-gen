(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v1)
		(pred_2 ?v6)
		(pred_5 ?v5)
		(pred_3 ?v5)
		(pred_4 ?v6 ?v5)
		(pred_6)
		(pred_1 ?v6))

   (:action op_3
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_5 ?v3) (pred_5 ?v8) (pred_3 ?v3))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v3))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_2 ?v2) (pred_5 ?v4)
			    (pred_4 ?v2 ?v4) (pred_3 ?v4) (pred_6))
       :effect (and (pred_1 ?v2)
		    (not (pred_4 ?v2 ?v4)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_2 ?v2) (pred_5 ?v4)
			    (pred_1 ?v2) (pred_3 ?v4))
       :effect (and (pred_4 ?v2 ?v4)
		    (pred_6)
		    (not (pred_1 ?v2)))))
