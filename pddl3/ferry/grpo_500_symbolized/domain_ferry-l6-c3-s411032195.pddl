(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v7)
		(pred_4 ?v5)
		(pred_5 ?v8)
		(pred_2 ?v8)
		(pred_3 ?v5 ?v8)
		(pred_6)
		(pred_1 ?v5))

   (:action op_2
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_5 ?v2) (pred_5 ?v1) (pred_2 ?v2))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v6)
			    (pred_3 ?v3 ?v6) (pred_2 ?v6) (pred_6))
       :effect (and (pred_1 ?v3)
		    (not (pred_3 ?v3 ?v6)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v6)
			    (pred_1 ?v3) (pred_2 ?v6))
       :effect (and (pred_3 ?v3 ?v6)
		    (pred_6)
		    (not (pred_1 ?v3)))))
