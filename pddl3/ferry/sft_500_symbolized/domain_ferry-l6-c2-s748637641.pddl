(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_6 ?v8)
		(pred_4 ?v7)
		(pred_5 ?v7)
		(pred_1 ?v8 ?v7)
		(pred_2)
		(pred_3 ?v8))

   (:action op_2
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_4 ?v6) (pred_4 ?v3) (pred_5 ?v6))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_6 ?v4) (pred_4 ?v2)
			    (pred_1 ?v4 ?v2) (pred_5 ?v2) (pred_2))
       :effect (and (pred_3 ?v4)
		    (not (pred_1 ?v4 ?v2)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_6 ?v4) (pred_4 ?v2)
			    (pred_3 ?v4) (pred_5 ?v2))
       :effect (and (pred_1 ?v4 ?v2)
		    (pred_2)
		    (not (pred_3 ?v4)))))
